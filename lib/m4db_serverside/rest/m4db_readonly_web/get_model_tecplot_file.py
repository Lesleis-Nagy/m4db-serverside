r"""
A service to retrieve a tecplot model files.
"""
r"""
A collection of Falcon web services to retrieve model data.
"""

import io
import mimetypes
import os
import zipfile

import falcon

from m4db_database.configuration import read_config_from_environ
from m4db_database.utilities import uid_to_dir
from m4db_serverside import global_vars


class GetModelTecplotFile:
    r"""
    Falcon service to retrieve Model path Tecplot files.
    """

    def on_get(self, req, resp, unique_id):
        r"""
        Retrieve the information associated with a model object that has
        the given unique id.

        :param req: the Falcon request object.
        :param resp: the Falcon response object
        :param unique_id: the unique identifier of the model.
        """
        config = read_config_from_environ()

        model_path_file = os.path.join(
            config["file_root"],
            global_vars.model_directory_name,
            uid_to_dir(unique_id),
            global_vars.magnetization_tecplot_file_name
        )

        if os.path.exists(model_path_file):
            resp.content_type = "text/plain"
            resp.stream = io.open(model_path_file, "rb")
            resp.content_length = os.path.getsize(model_path_file)

        else:
            resp.status = falcon.HTTP_404


class GetModelTecplotFileZip:
    r"""
    Falcon service to retrieve model tecplot files as a zipped object.
    """

    def on_get(self, req, resp, unique_id):
        r"""
        Retrieve the information associated with a model object that
        has the given unique ID, as a zipped file.
        :param req: Falcon request object.
        :param resp: Falcon response object.
        :param unique_id: unique identifier of the model.
        :return: None
        """
        config = read_config_from_environ()

        model_path_file = os.path.join(
            config["file_root"],
            global_vars.model_directory_name,
            uid_to_dir(unique_id),
            global_vars.magnetization_tecplot_file_name
        )

        zip_path_file = os.path.join(
            config["file_root"],
            global_vars.model_directory_name,
            uid_to_dir(unique_id),
            global_vars.magnetization_tecplot_zip_file_name
        )

        # If the NEB file doesn't exist then the zip cannot exist ...
        if not os.path.exists(model_path_file):
            # ... return 404
            resp.status = falcon.HTTP_404
            return

        # If the NEB does exist, but the zip does not exist
        if os.path.exists(model_path_file) and not os.path.exists(zip_path_file):
            # ... create the zip
            zf = zipfile.ZipFile(zip_path_file, "w", zipfile.ZIP_DEFLATED)
            # Within the zip file, use the unique id
            zf.write(model_path_file, "{}.tec".format(unique_id))
            zf.close()

        # Return the zip file to the user
        if os.path.exists(zip_path_file):
            resp.content_type = mimetypes.guess_type(zip_path_file)[0]
            resp.stream = io.open(zip_path_file, "rb")
            resp.content_length = os.path.getsize(zip_path_file)

