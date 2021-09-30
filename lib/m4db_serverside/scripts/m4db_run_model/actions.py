r"""
A selection of actions that will execute a model.
"""
import json

from m4db_database.configuration import read_config_from_environ

from m4db_serverside.rest_api.sessions import get_session


def set_model_status(unique_id, status):
    config = read_config_from_environ()
    service_url = "http://{host:}:{port:}/set_model_status".format(
        host=config["m4db_runner_web"]["host"],
        port=config["m4db_runner_web"]["port"]
    )

    session = get_session()
    session.post(service_url, data=json.dumps({
        "unique_id": unique_id,
        "status": status
    }))
