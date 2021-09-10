r"""
This is a set of routines that will produce slurm scripts.
"""
import os

from jinja2 import Environment, PackageLoader, select_autoescape

from m4db_database.orm import Model
from m4db_database.orm import NEB

from m4db_database.utilities import uid_to_dir

from m4db_serverside import global_vars


def slurm_model_script(model: Model, config):
    r"""
    This function generates the 'standard' slurm model runner script.

    :param model: the ORM model to execute.
    :param config: configuration information.
    """
    template_loader = PackageLoader("m4db_serverside", "templates/slurm")
    template_env = Environment(
        loader=template_loader,
        autoescape=select_autoescape(['jinja2'])
    )

    template = template_env.get_template(
        "slurm_model.jinja2"
    )

    uuid_dir = os.path.join(
        config["file_root"],
        uid_to_dir(model.unique_id)
    )

    tslurm = {}

    tslurm['unique_id'] = model.unique_id
    tslurm['N'] = 1
    tslurm['n'] = 1
    tslurm['c'] = 1
    tslurm['time'] = '99:99:99'
    tslurm['merrill_script'] = global_vars.model_merrill_script_file_name
    tslurm['model_stdout_txt'] = global_vars.model_stdout_file_name
    tslurm['model_stderr_txt'] = global_vars.model_stderr_file_name
    tslurm['working_directory'] = uuid_dir

    return template.render(sdata=tslurm)


def slurm_neb_script(neb: NEB, config):
    r"""
    This function generates the 'standard' slurm NEB runner script.
    :param neb: the neb database object associated with the path that the SLURM runner script will execute
    :param config: configuration data.
    :return: the SLURM runner script text
    """
    template_loader = PackageLoader("m4db_serverside", "templates/slurm")
    template_env = Environment(
        loader=template_loader,
        autoescape=select_autoescape(['jinja2'])
    )

    template = template_env.get_template(
        "slurm_neb.jinja2"
    )

    uuid_dir = os.path.join(
        config["file_root"],
        uid_to_dir(neb.unique_id)
    )

    slurm_data = {
        'unique_id': neb.unique_id,
        'N': 1,
        'n': 1,
        'c': 1,
        'time': '99:99:99',
        'merrill_script': global_vars.model_merrill_script_file_name,
        'neb_stdout_txt': global_vars.model_stdout_file_name,
        'neb_stderr_txt': global_vars.model_stderr_file_name,
        'working_directory': uuid_dir
    }

    return template.render(sdata=slurm_data)
