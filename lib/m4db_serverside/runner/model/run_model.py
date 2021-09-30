r"""
Scripts to run a micromagnetic model.
"""

import os
import tempfile

from m4db_database.configuration import read_config_from_environ
from m4db_database.utilities import uid_to_dir

from m4db_serverside import global_vars

from m4db_serverside.templates import template_env


def run_model(unique_id):
    config = read_config_from_environ()

    # This is the final destination of model data.
    database_dir = os.path.join(
        config["file_root"],
        global_vars.model_directory_name,
        uid_to_dir(unique_id)
    )

    # This is the working directory.
    working_dir = os.path.join(
        config["m4db_serverside"]["working_dir"],
        unique_id
    )

    with tempfile.TemporaryDirectory(dir=working_dir):
        # Create the merrill script.
        t_env = template_env("merrill")


