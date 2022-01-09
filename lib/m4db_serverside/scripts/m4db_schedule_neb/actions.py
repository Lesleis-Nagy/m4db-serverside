r"""
A selection of actions that will schedule NEBs for execution.
"""
import sys

from subprocess import PIPE, Popen

from tempfile import NamedTemporaryFile

from m4db_database.sessions import get_session
from m4db_database.configuration import read_config_from_environ

from m4db_serverside.templates import template_env
from m4db_serverside.db.neb.retrieve import get_nebs
from m4db_serverside.rest_api.m4db_runner_web.set_neb_running_status import set_neb_running_status


def schedule_neb(unique_id):
    r"""
    Create a scripts and schedule with slurm.
    :param unique_id: the unique_id of the neb to schedule.
    :return: None
    """
    config = read_config_from_environ()
    slurm_template = template_env("slurm").get_template("slurm_neb.jinja2")

    sdata = {
        "unique_id": unique_id,
        "N": 1,
        "n": 1,
        "c": 1,
        "time": "99:99:99",
        "working_directory": config["m4db_serverside"]["working_dir"],
        "module_dir": config["m4db_serverside"]["module_dir"],
        "modules": config["m4db_serverside"]["modules"]
    }

    # Open a temporary file.
    with NamedTemporaryFile("w") as fout:
        fout.write(slurm_template.render(sdata=sdata))

        # print(slurm_template.render(sdata=sdata))

        fout.flush()

        cmd = "{} {}".format(config["m4db_serverside"]["slurm_exe"], fout.name)
        proc = Popen(cmd, stdout=PIPE, stderr=PIPE, shell=True, universal_newlines=True, text=True)

        stdout, stderr = proc.communicate()

        if stderr != "":
            print("Some error occurred when attempting to schedule job with slurm")
            print("--> {}".format(stderr))
            sys.exit(1)
        else:
            print("Submitted job for unique ID {}".format(unique_id))


def schedule_jobs(**kwargs):
    r"""
    Schedule a selection of jobs based on the input arguments.
    :param kwargs: job arguments
    :return: None
    """
    with get_session(nullpool=True) as session:
        nebs = get_nebs(session, **kwargs)
        print(f"len nebs: {len(nebs)}")
        neb_unique_ids = []
        for neb in nebs:
            neb_unique_ids.append(neb.unique_id)
        session.close()

    if kwargs["list_unique_ids"]:
        print("--------------------------")
        print(" NEB unique ids:")
        print("--------------------------")
        for index, neb_unique_id in enumerate(neb_unique_ids):
            print("{:5d}) {}".format(index+1, neb_unique_id))
        print()

    nnebs = len(neb_unique_ids)
    if kwargs["real_run"]:
        if kwargs["limit"] > 0:
            limit = kwargs["limit"]
            print(f"Scheduling {limit} NEB(s)")
            for index, neb_unique_id in enumerate(neb_unique_ids):
                if index <= limit-1:
                    schedule_neb(neb_unique_id)
                    set_neb_running_status(neb_unique_id, "scheduled")
        else:
            print("Scheduling {} NEB(s).".format(nnebs))
            for neb_unique_id in neb_unique_ids:
                schedule_neb(neb_unique_id)
                set_neb_running_status(neb_unique_id, "scheduled")
    else:
        print("{} NEB(s) found, use --real-run to schedule them for execution.".format(nnebs))

