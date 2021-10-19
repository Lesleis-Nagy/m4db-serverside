r"""
A service to retrieve a tecplot model files.
"""
r"""
A collection of Falcon web services to retrieve model data.
"""

import io
import json
import mimetypes
import os
import zipfile

import falcon

from m4db_database.configuration import read_config_from_environ
from m4db_database.utilities import uid_to_dir
from m4db_serverside import global_vars
from m4db_serverside.file_io.tecplot import read_tecplot


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

        # If the Model file doesn't exist then the zip cannot exist ...
        if not os.path.exists(model_path_file):
            # ... return 404
            resp.status = falcon.HTTP_404
            return

        # If the model does exist, but the zip does not exist
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


class GetModelJSONFile:
    r"""
    Falcon service to retrieve a model JSON file.
    """

    def on_get(self, req, resp, unique_id):
        r"""
        Retrieve the information associated with a model object that has the given unique ID, as a JSON file.
        :param req: Falcon request object
        :param resp: Falcon response object
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

        json_path_file = os.path.join(
            config["file_root"],
            global_vars.model_directory_name,
            uid_to_dir(unique_id),
            global_vars.magnetization_json_file_name
        )

        # If the Model file doesn't exist then the json cannot exist ...
        if not os.path.exists(model_path_file):
            # ... return 404
            resp.status = falcon.HTTP_404
            return

        # If the model exists but the json doesn't exist, then create the JSON
        if not os.path.exists(json_path_file):
            tecplot_data = read_tecplot(model_path_file, jsonify=True)
            with open(json_path_file, "w") as fout:
                fout.write(json.dumps(tecplot_data, sort_keys=True, indent=4))

        # Return the stream
        if os.path.exists(json_path_file):
            resp.content_type = mimetypes.guess_type(json_path_file)[0]
            resp.stream = io.open(json_path_file, "rb")
            resp.content_length = os.path.getsize(json_path_file)


class GetModelJSONFileZip:
    r"""
    Falcon service to retrieve a model JSON zipped file.
    """

    def on_get(self, req, resp, unique_id):
        r"""
        Retrieve the information associated with model object that has the given unique ID
        as a zipped JSON file.
        :param req: Falcon request object.
        :param resp: Falcon response object.
        :param unique_id: unique identifier of the model.
        :return: None.
        """
        config = read_config_from_environ()

        model_path_file = os.path.join(
            config["file_root"],
            global_vars.model_directory_name,
            uid_to_dir(unique_id),
            global_vars.magnetization_tecplot_file_name
        )

        json_path_file = os.path.join(
            config["file_root"],
            global_vars.model_directory_name,
            uid_to_dir(unique_id),
            global_vars.magnetization_json_file_name
        )

        zipped_json_path_file = os.path.join(
            config["file_root"],
            global_vars.model_directory_name,
            uid_to_dir(unique_id),
            global_vars.magnetization_json_zip_file_name
        )

        # If the model exists but the json doesn't exist, then create the JSON
        if not os.path.exists(json_path_file):
            tecplot_data = read_tecplot(model_path_file, jsonify=True)
            with open(json_path_file, "w") as fout:
                fout.write(json.dumps(tecplot_data, sort_keys=True, indent=4))

        # The JSON zip files doesn't exist then create it
        if os.path.exists(json_path_file):
            if not os.path.exists(zipped_json_path_file):
                # ... create the zip
                zf = zipfile.ZipFile(zipped_json_path_file, "w", zipfile.ZIP_DEFLATED)
                # Within the zip file, use the unique id
                zf.write(json_path_file, "{}.json".format(unique_id))
                zf.close()

        # Return the stream
        if os.path.exists(zipped_json_path_file):
            resp.content_type = mimetypes.guess_type(zipped_json_path_file)[0]
            resp.stream = io.open(zipped_json_path_file, "rb")
            resp.content_length = os.path.getsize(zipped_json_path_file)
