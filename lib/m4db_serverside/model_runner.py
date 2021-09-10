r"""
Routines to run micromagnetic models.
"""
import os
import sys

from subprocess import Popen, PIPE

from m4db_database.sessions import get_session
from m4db_database.orm import Model
from m4db_database.orm import RunningStatus

from m4db_database.utilities import uid_to_dir

from m4db_serverside.parsers.merrill_parser import parse_merrill_stdout

from m4db_serverside import global_vars


def get_non_pooled_session():
    r"""
    Retrieve a non-pooled session.
    :return: a non pooled direct connection to the database.
    """
    session = get_session(nullpool=True)
    return session


def set_model_state_running(unique_id):
    r"""
    Sets a model to the running state.
    :param unique_id: the unique id of the model that we will be running.
    :return: None
    """
    session = get_non_pooled_session()

    running_state = session.query(RunningStatus).filter(RunningStatus.name == global_vars.running_status_running).one()
    model = session.query(Model).filter(Model.unique_id == unique_id).one()
    model.running_status = running_state
    session.commit()
    session.close()


def set_model_state_failed(unique_id):
    r"""
    Sets a model to the failed state.
    :param unique_id: the unique id of the model that we will be failing.
    :return: None
    """
    session = get_non_pooled_session()

    failed_state = session.query(RunningStatus).filter(RunningStatus.name == global_vars.running_status_failed).one()
    model = session.query(Model).filter(Model.unique_id == unique_id).one()
    model.running_status = failed_state
    session.commit()
    session.close()


def update_model(unique_id, merrill_result, tecplot_result):
    r"""
    Updates a model to the 'finished' running state and updates model parameters.
    :param unique_id: the unique id of the model that we will be updating.
    :param merrill_result: the result parsed from MERRILL stdout that will be added to the model.
    :param model_result: the result extracted from the model's tecplot file.
    :return: None
    """
    session = get_non_pooled_session()

    finished_state = session.query(RunningStatus).filter(RunningStatus.name == global_vars.running_status_finished).one()
    model:Model = session.query(Model).filter(Model.unique_id == unique_id).one()
    model.e_typical = merrill_result["typical_energy_joule"]
    model.e_anis = merrill_result["anis_energy"]
    model.e_ext = merrill_result["ext_energy"]
    model.e_exch1 = merrill_result["exch1_energy"]
    model.e_exch2 = merrill_result["exch2_energy"]
    model.e_exch3 = merrill_result["exch3_energy"]
    model.e_exch4 = merrill_result["exch4_energy"]
    model.e_tot = merrill_result["tot_energy"]
    model.mx_tot = merrill_result["mx"]
    model.my_tot = merrill_result["my"]
    model.mz_tot = merrill_result["mz"]


def run_model(unique_id, config):
    r"""
    Attempt to run the model with the unique id.
    :param unique_id:
    "param config:
    :return:
    """
    # Create the working directory
    working_directory = os.path.join(
        config["file_root"],
        global_vars.model_directory_name,
        uid_to_dir(unique_id))

    # Check that the working directory exists, if it doesn't, then report the error and exit.
    if not os.path.isdir(working_directory):
        print("ERROR: the working directory '{}' does not exist.".format(working_directory))
        sys.exit(1)

    # Switch to the working directory.
    os.chdir(working_directory)

    # Make sure that our merrill script is there.
    if not os.path.isfile(global_vars.model_merrill_script_file_name):
        print("ERROR: attempting to run MERRILL for '{}' but there is no MERRILL script.".format(unique_id))
        sys.exit(1)

    # Set the status of the model to 'running'.
    set_model_state_running(unique_id)

    # Run the job.
    merrill_process = Popen(
        "merrill {}".format(global_vars.model_merrill_script_file_name),
        stdout=PIPE,
        stderr=PIPE,
        shell=True,
        universal_newlines=True,
        text=True)

    # Write standard output & standard error to files.
    merrill_stdout, merrill_stderr = merrill_process.communicate()

    with open(global_vars.model_stdout_file_name, "w") as fout:
        fout.write(merrill_stdout)

    with open(global_vars.model_stderr_file_name, "w") as fout:
        fout.write(merrill_stderr)

    # Process the standard output.
    merrill_result = parse_merrill_stdout(merrill_stdout)

    # Change the model output tecplot name.
    if os.path.isfile(global_vars.magnetization_mult_tecplot_file_name):
        os.rename(global_vars.magnetization_mult_tecplot_file_name, global_vars.magnetization_tecplot_file_name)

    # Read the tecplot file and perform some postprocessing calculations.


    # If the model failed ...
    if merrill_result["failed"]:
        # ... then set the failure flag.
        set_model_state_failed(unique_id)
    else:
        # ... otherwise update the model.
        update_model(unique_id, merrill_result)