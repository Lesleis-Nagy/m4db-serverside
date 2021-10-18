r"""
An API call that will retrieve the software executable associated with a Model.
"""
import json

from m4db_database.configuration import read_config_from_environ

from m4db_serverside.rest_api.sessions import get_session


def get_model_software_executable(unique_id):
    r"""
    Retrieve the executable that will be used to run a model.
    :param unique_id: the unique ID of a model.
    :return: None.
    """
    config = read_config_from_environ()
    service_url = "http://{host:}:{port:}/get_model_software_executable/{unique_id:}".format(
        host=config["m4db_runner_web"]["host"],
        port=config["m4db_runner_web"]["port"],
        unique_id=unique_id
    )
    session = get_session()
    response = session.get(service_url)
    response.raise_for_status()

    output = json.loads(response.text)
    return output["return"]
