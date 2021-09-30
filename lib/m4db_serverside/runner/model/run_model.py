r"""
Scripts to run a micromagnetic model.
"""

import os
import shutil
import tempfile

from subprocess import Popen, PIPE

from m4db_database.configuration import read_config_from_environ
from m4db_database.utilities import uid_to_dir

from m4db_serverside.rest_api.m4db_runner_web.get_model_merrill_script import get_model_merrill_script
from m4db_serverside.rest_api.m4db_runner_web.set_model_running_status import set_model_running_status
from m4db_serverside.rest_api.m4db_runner_web.set_model_quants import set_model_quants

from m4db_serverside.parsers.merrill_parser import parse_merrill_stdout

from m4db_serverside.postprocessing.field_calculations import tec_to_unstructured_grid
from m4db_serverside.postprocessing.field_calculations import net_quantities

from m4db_serverside import global_vars


def run_model(unique_id):
    config = read_config_from_environ()

    # This is the final destination of model data.
    database_dir = os.path.join(
        config["file_root"],
        global_vars.model_directory_name,
        uid_to_dir(unique_id)
    )

    # This is the working directory.
    working_dir = config["m4db_serverside"]["working_dir"]

    with tempfile.TemporaryDirectory(dir=working_dir) as tmpdir:
        # Switch to the working directory.
        os.chdir(tmpdir)

        # Create a Merrill script.
        get_model_merrill_script(unique_id, global_vars.model_merrill_script_file_name)

        # Set the running status to 'running'
        set_model_running_status(unique_id, "running")

        # Execute the merrill script.
        proc = Popen(
            "{merrill_exe:} {merrill_script:}".format(
                merrill_exe=config["mm_binary"], merrill_script=global_vars.model_merrill_script_file_name
            ),
            stdout=PIPE,
            stderr=PIPE,
            universal_newlines=True,
            text=True,
            shell=True
        )
        stdout, stderr = proc.communicate()
        print(stdout)

        # Write standard output and standard error to files.
        with open(global_vars.model_stdout_file_name, "w") as fout:
            fout.write(stdout)
        with open(global_vars.model_stderr_file_name, "w") as fout:
            fout.write(stderr)

        # Check output.
        quants1 = parse_merrill_stdout(global_vars.model_stdout_file_name)
        if quants1["failed"]:
            set_model_running_status(unique_id, "re-run")
            return

        # Calculate additional quants.
        ug = tec_to_unstructured_grid(global_vars.magnetization_tecplot_file_name)
        quants2 = net_quantities(ug)

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
                         volume=quants2["volume"])

        # Copy all files to the final destination
        os.makedirs(database_dir, exist_ok=True)
        src_files = os.listdir(".")
        for file_name in src_files:
            if os.path.isfile(file_name):
                shutil.copy(file_name, database_dir)

        # Set to finished.
        set_model_running_status(unique_id, "finished")
