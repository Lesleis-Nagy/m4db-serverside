r"""
This is a set of routines that will produce merrill scripts.
"""

import os

from jinja2 import Environment, PackageLoader, select_autoescape

from m4db_database.orm import RandomField
from m4db_database.orm import UniformField
from m4db_database.orm import ModelField
from m4db_database.orm import Model
from m4db_database.orm import NEB

from m4db_database.utilities import uid_to_dir

from m4db_serverside import global_vars


def merrill_model_script(model: Model, config):
    r"""
    This function generates the 'standard' merrill model script, it executes a
    model with a given geometry and material (and possibly a given ambient field).

    Arguments:
        model  : and m4db.orm.Model object (see orm.py)
        config : configuration information

    Output:
        a merrill script string that may be saved to a file for execution.
    """
    template_loader = PackageLoader("m4db_serverside", "templates/merrill")
    template_env = Environment(
        loader=template_loader,
        autoescape=select_autoescape(['jinja2'])
    )

    template = template_env.get_template(
        "merrill_model.jinja2"
    )

    # Hold template model data.
    tmodel = {}

    # Set the model's mesh
    abs_mesh_file = os.path.join(
        config["file_root"],
        global_vars.geometry_directory_name,
        uid_to_dir(model.geometry.unique_id),
        global_vars.geometry_patran_file_name
    )
    tmodel['mesh_file'] = abs_mesh_file

    # Set some of the model's execution parameters
    tmodel['max_evals'] = model.max_energy_evaluations
    tmodel['minimizer'] = 'ConjugateGradient'
    tmodel['exchange_calculator'] = 1

    # Set the initial field data
    tmodel['initial_field'] = {}
    if type(model.start_magnetization) is RandomField:
        tmodel['initial_field']['type'] = 'random'
    elif type(model.start_magnetization) is UniformField:
        start_magnetization: UniformField = model.start_magnetization
        tmodel['initial_field']['type'] = 'uniform'
        tmodel['initial_field']['x'] = start_magnetization.dir_x
        tmodel['initial_field']['y'] = start_magnetization.dir_y
        tmodel['initial_field']['z'] = start_magnetization.dir_z
    elif type(model.start_magnetization) is ModelField:
        tmodel['initial_field']['type'] = 'model'
        tmodel['initial_field']['dat_file'] = global_vars.magnetization_dat_file_name

    # Set the materials
    tmodel['materials'] = []

    for mma in model.materials:
        tmodel['materials'].append({
            'submesh_id': mma.submesh_id,
            'name': mma.material.name,
            'temperature': mma.material.temperature,
            'ms': mma.material.ms,
            'k1': mma.material.k1,
            'aex': mma.material.aex
        })

    # Set the model ambient field
    tmodel['ambient_field'] = {}
    if model.external_field is None:
        # There is no external field
        tmodel['ambient_field']['strength'] = 0
        tmodel['ambient_field']['unit'] = 'mT'
        tmodel['ambient_field']['x'] = -1.0
        tmodel['ambient_field']['y'] = -1.0
        tmodel['ambient_field']['z'] = -1.0
    else:
        # There is an external field, so use its values
        external_field: UniformField = model.external_field
        tmodel['ambient_field']['strength'] = external_field.magnitude
        tmodel['ambient_field']['unit'] = external_field.unit
        tmodel['ambient_field']['x'] = external_field.dir_x
        tmodel['ambient_field']['y'] = external_field.dir_y
        tmodel['ambient_field']['z'] = external_field.dir_z

    # Set the log file
    tmodel['energy_log_file'] = global_vars.energy_log_file_name

    # Set the output
    tmodel['output'] = global_vars.magnetization_output_file_name

    return template.render(model=tmodel)


def merrill_model_energies_script(model, config):
    r"""
    This function generates a merrill 'energies' script that will be used to extract
    the different energies of a particular structure, it executes a
    model with a given geometry and material (and possibly a given ambient field).

    Arguments:
        model : and m4db.orm.Model object (see orm.py)
        config: configuration information

    Output:
        a merrill script string that may be saved to a file for execution.
    """
    template_loader = PackageLoader("m4db_serverside", "templates/merrill")
    template_env = Environment(
        loader=template_loader,
        autoescape=select_autoescape(['jinja2'])
    )

    template = template_env.get_template(
        "merrill_model_energies.jinja2"
    )

    tmodel = {}

    # Set the model's mesh
    abs_mesh_file = os.path.join(
        config["file_root"],
        global_vars.geometry_directory_name,
        uid_to_dir(model.geometry.unique_id),
        global_vars.geometry_patran_file_name
    )

    tmodel['mesh_file'] = abs_mesh_file

    # Set some of the model's execution parameters
    tmodel['max_evals'] = model.max_energy_evaluations
    tmodel['minimizer'] = 'ConjugateGradient'
    tmodel['exchange_calculator'] = 1

    tmodel['materials'] = []

    # Set the material
    for mma in model.materials:
        tmodel['materials'].append({
            'submesh_id': mma.submesh_id,
            'name': mma.material.name,
            'temperature': mma.material.temperature,
            'ms': mma.material.ms,
            'k1': mma.material.k1,
            'aex': mma.material.aex
        })

    # Set the model ambient field
    tmodel['ambient_field'] = {}
    if model.external_field is None:
        # There is no external field
        tmodel['ambient_field']['strength'] = 0
        tmodel['ambient_field']['unit'] = 'mT'
        tmodel['ambient_field']['x'] = -1.0
        tmodel['ambient_field']['y'] = -1.0
        tmodel['ambient_field']['z'] = -1.0
    else:
        # There is an external field, so use its values
        theta = model.external_field.theta
        phi = model.external_field.phi

        x,y,z = UniformField.spherical_to_cartesian_direction(theta, phi)

        tmodel['ambient_field']['strength'] = model.external_field.magnitude
        tmodel['ambient_field']['unit'] = model.external_field.unit
        tmodel['ambient_field']['x'] = x
        tmodel['ambient_field']['y'] = y
        tmodel['ambient_field']['z'] = z

    # Set the magnetization
    tmodel['field'] = {}
    tmodel['field']['dat_file'] = global_vars.magnetization_dat_file_name

    return template.render(model=tmodel)


def merrill_neb_root_script(neb: NEB, config):
    r"""
    This function generates a MERRILL 'NEB' script that will be used to compute an initial or 'root' NEB path.

    Args:
        neb: the NEB database object containing the data for the NEB path calculation.
        config: configuration information

    Returns: a string containing the MERRILL neb script.

    """
    template_loader = PackageLoader("m4db_serverside", "templates/merrill")
    template_env = Environment(
        loader=template_loader,
        autoescape=select_autoescape(['jinja2'])
    )

    # This NEB path has no parent and so we'll use the 'root' MERRILL template
    template = template_env.get_template(
        "merrill_neb_root_path.jinja2"
    )

    # The geometry file associated with the NEB path (contained in the model objects that comprise
    # the start/end point).
    geometry_file = os.path.join(
        config["file_root"],
        global_vars.geometry_directory_name,
        uid_to_dir(neb.start_model.geometry.unique_id),
        global_vars.geometry_patran_file_name
    )

    # The start magnetization field.
    start_magnetization_file = os.path.join(
        config["file_root"],
        global_vars.model_directory_name,
        uid_to_dir(neb.start_model.unique_id),
        global_vars.magnetization_dat_file_name
    )

    # The end magnetization field.
    end_magnetization_file = os.path.join(
        config["file_root"],
        global_vars.model_directory_name,
        uid_to_dir(neb.end_model.unique_id),
        global_vars.magnetization_dat_file_name
    )

    tmodel = {
        'mesh_file': geometry_file,
        'max_energy_evaluations': neb.max_energy_evaluations,
        'max_path_evaluations': neb.max_path_evaluations,
        'external_field': {
            'strength': neb.external_field.magnitude if neb.external_field is not None else 0.0,
            'unit': neb.external_field.unit if neb.external_field is not None else 'mT',
            'x': neb.external_field.dir_x if neb.external_field is not None else -1.0,
            'y': neb.external_field.dir_y if neb.external_field is not None else -1.0,
            'z': neb.external_field.dir_z if neb.external_field is not None else -1.0,
        },
        'start_magnetization': start_magnetization_file,
        'end_magnetization': end_magnetization_file,
        'energy_log_file': 'energy',
        'neb_path_points': neb.no_of_points,
        'minimizer': 'ConjugateGradient',
        'exchange_calculator': 1,
        'neb_file_name': global_vars.neb_tecplot_file_name
    }

    # Add the materials here (we will use the start model's materials, however they should both be the same).
    tmodel['materials'] = []

    for mma in neb.start_model.materials:
        tmodel['materials'].append({
            'submesh_id': mma.submesh_id,
            'name': mma.material.name,
            'temperature': mma.material.temperature,
            'ms': mma.material.ms,
            'k1': mma.material.k1,
            'aex': mma.material.aex
        })

    return template.render(neb=tmodel)


def merrill_neb_child_script(neb: NEB, config):
    r"""
    This function generates a MERRILL 'NEB' script that will be used to compute a "child" path i.e. a
    path that has a path pre-defined.

    Args:
        neb: the NEB database object containing the data for the NEB path calculation.
        config: configuration information

    Returns: a string containing the MERRILL neb script.
    """
    template_loader = PackageLoader("m4db_serverside", "templates/merrill")
    template_env = Environment(
        loader=template_loader,
        autoescape=select_autoescape(['jinja2'])
    )

    # This NEB path has a parent and so we'll use the 'child' MERRILL template
    template = template_env.get_template(
        "merrill_neb_child_path.jinja2"
    )

    initial_path = os.path.join(
        config["file_root"],
        global_vars.neb_directory_name,
        uid_to_dir(neb.parent_neb.unique_id),
        global_vars.neb_tecplot_file_name
    )

    tmodel = {
        'neb_initial_path_name': initial_path,
        'max_energy_evaluations': neb.max_energy_evaluations,
        'max_path_evaluations': neb.max_path_evaluations,
        'external_field': {
            'strength': neb.external_field.magnitude if neb.external_field is not None else 0.0,
            'unit': neb.external_field.unit if neb.external_field is not None else 'mT',
            'x': neb.external_field.dir_x if neb.external_field is not None else -1.0,
            'y': neb.external_field.dir_y if neb.external_field is not None else -1.0,
            'z': neb.external_field.dir_z if neb.external_field is not None else -1.0,
        },
        'energy_log_file': 'energy',
        'minimizer': 'ConjugateGradient',
        'exchange_calculator': 1,
        'neb_file_name': global_vars.neb_tecplot_file_name
    }

    # Add the materials here (we will use the start model's materials, however they should both be the same).
    tmodel['materials'] = []

    for mma in neb.start_model.materials:
        tmodel['materials'].append({
            'submesh_id': mma.submesh_id,
            'name': mma.material.name,
            'temperature': mma.material.temperature,
            'ms': mma.material.ms,
            'k1': mma.material.k1,
            'aex': mma.material.aex
        })

    return template.render(neb=tmodel)


def merrill_neb_script(neb: NEB):
    r"""
    This function generates a MERRILL 'NEB' script that will be used to compute an NEB path
    :param neb:
    :return:
    """
    if neb.parent_neb is None:
        return merrill_neb_root_script(neb)
    else:
        return merrill_neb_child_script(neb)


