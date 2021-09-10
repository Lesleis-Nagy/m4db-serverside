import os

import yaml

from m4db_database.decorators import static

from m4db_serverside import global_vars

M4DB_SERVERSIDE_CONFIG_ENTRIES = [
    "db_user", "project"
]


@static(config=None)
def read_config_from_file(file_name):
    r"""
    Reads an M4DB database configuration from a file. An example configuration file looks like
        db_user: default m4db user
        project: the default m4db project

    Args:
        file_name: the M4DB configuration file.

    Returns:
        A python dictionary representation of M4DB database related configuration information.

    """
    if read_config_from_file.config is None:
        with open(file_name, "r") as fin:
            read_config_from_file.config = yaml.load(fin, Loader=yaml.FullLoader)
            for entry in M4DB_SERVERSIDE_CONFIG_ENTRIES:
                if entry not in read_config_from_file.config.keys():
                    raise ValueError("Configuration is missing required parameter '{}'".format(entry))
    return read_config_from_file.config


def read_config_from_environ():
    r"""
    Reads an M4DB database configuration by checking for an environment variable called
    global_vars.m4db_serverside_config_environment_variable.

    Returns:
        A python dictionary representation of M4DB database related configuration information or None if
        global_vars.m4db_serverside_config_environment_variable was not set.

    """
    file_name = os.environ.get(global_vars.m4db_serverside_config_environment_variable)

    if file_name is None:
        return None

    return read_config_from_file(file_name)


def write_config_to_file(file_name, config):
    r"""
    Writes M4DB database configuration.

    file_name: the file name to write configuration data to.
    config: A python dictionary representation of M4DB database related configuration information.

    Returns:
        None.
    """
    with open(file_name, "w") as fout:
        yaml.dump(config, fout, default_flow_style=False)

    return config


def write_config_to_environ(config):
    r"""
    Writes an M4DB database configuration by checking for an environment variable stored in
    global_vars.m4db_serverside_config_environment_variable
    Args:
        config: the configuration data that is to be written to the environment config.
    Returns:
        None

    """
    file_name = os.environ.get(global_vars.m4db_serverside_config_environment_variable)

    if file_name is None:
        raise ValueError("{} environment variable doesn't exist".format(
            global_vars.m4db_serverside_config_environment_variable))

    return write_config_to_file(file_name, config)