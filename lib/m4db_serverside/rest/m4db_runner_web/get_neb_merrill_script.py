r"""
A service to generate a script to run an NEB model.
"""
import os

from m4db_database.configuration import read_config_from_environ
from m4db_database.utilities import uid_to_dir

from m4db_database.orm.latest import NEB

from m4db_serverside import global_vars
from m4db_serverside.templates import template_env


def runner_data_with_parent(neb):
    config = read_config_from_environ()

    runner_data = {}

    # The initial path is the path belonging to the parent of this child.
    runner_data["neb_initial_path_name"] = os.path.join(
        config["file_root"],
        global_vars.neb_directory_name,
        uid_to_dir(neb.parent_neb.unique_id),
        global_vars.neb_tecplot_file_name
    )

    runner_data["max_energy_evaluations"] = neb.max_energy_evaluations
    runner_data["max_path_evaluations"] = neb.max_path_evaluations

    # NEB material data is taken from the start model (both start and end models should be the same).
    runner_data["material"] = []
    for mma in neb.start_model.materials:
        runner_data["material"].append({
            "submesh_id": mma.submesh_id,
            "name": mma.material.name,
            "temperature": mma.material.temperature,
            "ms": mma.material.ms,
            "k1": mma.material.k1,
            "aex": mma.material.aex
        })

    runner_data["external_field"] = {
        "strength": 0.0,
        "x": -1.0,
        "y": -1.0,
        "z": -1.0
    }
    if neb.external_field:
        runner_data["external_field"]["strength"] = neb.external_field.magnitude
        runner_data["external_field"]["x"] = neb.external_field.dir_x
        runner_data["external_field"]["y"] = neb.external_field.dir_y
        runner_data["external_field"]["z"] = neb.external_field.dir_z

    runner_data["energy_log_file"] = global_vars.energy_log_file_name

    runner_data["minimizer"] = "ConjugateGradient"
    runner_data["exchange_calculator"] = "1"

    runner_data["neb_file_name"] = global_vars.neb_tecplot_file_name

    return runner_data


def runner_data_without_parent(neb):
    config = read_config_from_environ()

    runner_data = {}

    # Use the geometry associated with the NEB start model (both start and end should be the same).
    runner_data["mesh_file"] = os.path.join(
        config["file_root"],
        global_vars.geometry_directory_name,
        uid_to_dir(neb.start_model.geometry.unique_id),
        global_vars.geometry_patran_file_name
    )

    runner_data["max_energy_evaluations"] = neb.max_energy_evaluations
    runner_data["max_path_evaluations"] = neb.max_path_evaluations

    # NEB material data is taken from the start model (both start and end models should be the same).
    runner_data["material"] = []
    for mma in neb.start_model.materials:
        runner_data["material"].append({
            "submesh_id": mma.submesh_id,
            "name": mma.material.name,
            "temperature": mma.material.temperature,
            "ms": mma.material.ms,
            "k1": mma.material.k1,
            "aex": mma.material.aex
        })

    # External field.
    runner_data["external_field"] = {
        "strength": 0.0,
        "x": -1.0,
        "y": -1.0,
        "z": -1.0
    }
    if neb.external_field:
        runner_data["external_field"]["strength"] = neb.external_field.magnitude
        runner_data["external_field"]["x"] = neb.external_field.dir_x
        runner_data["external_field"]["y"] = neb.external_field.dir_y
        runner_data["external_field"]["z"] = neb.external_field.dir_z

    # Start and end models.
    runner_data["start_magnetization"] = os.path.join(
        config["file_root"],
        global_vars.neb_directory_name,
        uid_to_dir(neb.start_model.unique_id),
        global_vars.magnetization_dat_file_name
    )
    runner_data["end_magnetization"] = os.path.join(
        config["file_root"],
        global_vars.neb_directory_name,
        uid_to_dir(neb.end_model.unique_id),
        global_vars.magnetization_dat_file_name
    )

    runner_data["energy_log_file"] = global_vars.energy_log_file_name
    runner_data["neb_path_points"] = neb.no_of_points

    runner_data["minimizer"] = "ConjugateGradient"
    runner_data["exchange_calculator"] = "1"

    runner_data["neb_file_name"] = global_vars.neb_tecplot_file_name

    return runner_data


class GetNEBMerrillScript:

    def on_get(self, req, resp, unique_id):
        r"""
        Get/generate a script to run an NEB model.
        :param req: request object.
        :param resp: response object.
        :param unique_id: the unique identifier of an NEB.
        :return: None.
        """
        config = read_config_from_environ()

        neb = self.session.query(NEB).\
            filter(NEB.unique_id == unique_id).one()

        # Depending on whether this has a parent, generate a script
        if neb.parent_neb:
            runner_data = runner_data_with_parent(neb)
            merrill_template = template_env("merrill").get_template("merrill_neb_child_path.jinja2")
        else:
            runner_data = runner_data_without_parent(neb)
            merrill_template = template_env("merrill").get_template("merrill_neb_root_path.jinja2")

        resp.content_type = "text/plain"
        resp.downloadable_as = global_vars.neb_merrill_script_file_name
        resp.body = merrill_template.render(neb=runner_data)
