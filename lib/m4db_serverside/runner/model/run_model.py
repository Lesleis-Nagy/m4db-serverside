r"""
Scripts to run a micromagnetic model.
"""

import os
import shutil
import tempfile
import random
import time
import zipfile

import simplejson as json
import numpy as np

from subprocess import Popen, PIPE

from m4db_database.utilities_logging import get_logger
from m4db_database.configuration import read_config_from_environ
from m4db_database.utilities import uid_to_dir

from m4db_serverside.rest_api.m4db_runner_web.get_model_merrill_script import get_model_merrill_script
from m4db_serverside.rest_api.m4db_runner_web.get_model_software_executable import get_model_software_executable
from m4db_serverside.rest_api.m4db_runner_web.set_model_running_status import set_model_running_status
from m4db_serverside.rest_api.m4db_runner_web.set_model_quants import set_model_quants

from m4db_serverside.file_io.merrill_stdio import read_merrill_stdout

from m4db_serverside.postprocessing.field_calculations import tec_to_unstructured_grid
from m4db_serverside.postprocessing.field_calculations import net_quantities

from m4db_serverside import global_vars


class NumpyEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, np.ndarray):
            return obj.tolist()
        return json.JSONEncoder.default(self, obj)


def run_model(unique_id):
    config = read_config_from_environ()
    logger = get_logger()

    # Wait a random amount of time based on unique_id.
    random.seed(unique_id)
    wait_time = random.randint(1, 20)
    print(f"waiting for {wait_time}s")
    time.sleep(wait_time)
    print("activating ...")

    # This is the final destination of model data.
    database_dir = os.path.join(
        config["file_root"],
        global_vars.model_directory_name,
        uid_to_dir(unique_id)
    )
    logger.debug(f"model destination: '{database_dir}")

    # This is the working directory.
    working_dir = config["m4db_serverside"]["working_dir"]

    with tempfile.TemporaryDirectory(dir=working_dir) as tmpdir:
        logger.debug(f"working directory: '{tmpdir}'")

        # Switch to the working directory.
        os.chdir(tmpdir)

        # Get the executable.
        executable = get_model_software_executable(unique_id)

        # Create a Merrill scripts.
        get_model_merrill_script(unique_id, global_vars.model_merrill_script_file_name)

        # Set the running status to 'running'
        set_model_running_status(unique_id, "running")

        # Execute the merrill scripts.
        logger.debug(f"executing {executable}")
        merrill_t0 = time.time()
        cmd = "{exe:} {merrill_script:}".format(
                exe=executable, merrill_script=global_vars.model_merrill_script_file_name
        )
        proc = Popen(
            cmd,
            stdout=PIPE,
            stderr=PIPE,
            universal_newlines=True,
            text=True,
            shell=True
        )
        stdout, stderr = proc.communicate()
        merrill_t1 = time.time()
        time_taken = merrill_t1 - merrill_t0
        logger.debug(f"merrill completed after {time_taken}s")

        # Check whether a file called "magnetization_mult.tec" was created - if so then rename it.
        if os.path.isfile(global_vars.magnetization_mult_tecplot_file_name):
            os.rename(global_vars.magnetization_mult_tecplot_file_name, global_vars.magnetization_tecplot_file_name)

        # Write standard output and standard error to files.
        with open(global_vars.model_stdout_file_name, "w") as fout:
            fout.write(stdout)
        with open(global_vars.model_stderr_file_name, "w") as fout:
            fout.write(stderr)

        # Check output.
        with open(global_vars.model_stdout_file_name) as fin:
            stdout_contents = fin.readlines()
        quants1 = read_merrill_stdout(stdout_contents)
        if quants1["failed"]:
            set_model_running_status(unique_id, "re-run")
            return

        # Calculate additional quants.
        ug, tec_raw = tec_to_unstructured_grid(global_vars.magnetization_tecplot_file_name)
        quants2 = net_quantities(ug)

        # Save a JSON version of our model.
        with open(global_vars.magnetization_json_file_name, "w") as fout:
            fout.write(json.dumps(tec_raw, cls=NumpyEncoder))

        # Update quants.
        set_model_quants(unique_id,
                         mx_tot=quants2["total_mx"],
                         my_tot=quants2["total_my"],
                         mz_tot=quants2["total_mz"],
                         vx_tot=quants2["total_vx"],
                         vy_tot=quants2["total_vy"],
                         vz_tot=quants2["total_vz"],
                         h_tot=quants2["total_h"],
                         rh_tot=quants2["total_rh"],
                         adm_tot=quants2["total_adm"],
                         e_typical=quants1["typical_energy_joule"],
                         e_anis=quants1["anis_energy"],
                         e_ext=quants1["ext_energy"],
                         e_demag=quants1["demag_energy"],
                         e_exch1=quants1["exch1_energy"],
                         e_exch2=quants1["exch2_energy"],
                         e_exch3=quants1["exch3_energy"],
                         e_exch4=quants1["exch4_energy"],
                         e_tot=quants1["tot_energy"],
                         volume=quants2["total_vol"])

        # Compress each file in the directory.
        logger.debug("Zipping files")
        src_files = os.listdir(".")
        src_zip_file = "data.zip"
        zout = zipfile.ZipFile(src_zip_file, "w", zipfile.ZIP_DEFLATED)
        for src_file in src_files:
            logger.debug(f"{src_file} --> {src_zip_file}")
            zout.write(src_file)
        zout.close()

        # Copy all files to the final destination
        os.makedirs(database_dir, exist_ok=True)

        src_files = os.listdir(".")
        for file_name in src_files:
            if os.path.isfile(file_name):
                logger.debug(f"Copying over file {file_name}")
                shutil.copy(file_name, database_dir)

        # Set to finished.
        set_model_running_status(unique_id, "finished")
