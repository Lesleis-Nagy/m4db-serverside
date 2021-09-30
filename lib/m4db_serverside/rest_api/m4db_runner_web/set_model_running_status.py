r"""
An API call that will set a model's quants values.
"""
import json

from m4db_database.configuration import read_config_from_environ

from m4db_serverside.rest_api.sessions import get_session


def set_model_running_status(unique_id, running_status):
    r"""
    Sets the model quants from kwargs.
    :param unique_id: the unique id of a model.
    :param running_status: the new model running status.
    :return: None
    """
    config = read_config_from_environ()
    service_url = "https://{host:}:{port:}/set_model_running_status".format(
        host=config["m4db_runner_web"]["host"],
        port=config["m4db_runner_web"]["port"]
    )

    session = get_session()
    response = session.post(service_url, data=json.dumps({"unique_id": unique_id, "running_status": running_status}), verify=False)
    response.raise_for_status()


