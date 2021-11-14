r"""
An API call that will retrieve whether an NEB has a parent.
"""

import json

from m4db_database.configuration import read_config_from_environ

from m4db_serverside.rest_api.sessions import get_session


def is_neb_parentless(unique_id):
    r"""
    Retrieve whether an NEB has a parent or not.
    :param unique_id: the unique ID of an NEB.
    :return: True if the the NEB has a parent, otherwise false.
    """
    config = read_config_from_environ()
    protocol = config["m4db_runner_web"]["protocol"]
    host = config["m4db_runner_web"]["host"]
    port = config["m4db_runner_web"]["port"]

    service_url = f"{protocol}://{host}:{port}/is_neb_parentless/{unique_id}"
    session = get_session()
    response = session.get(service_url)
    response.raise_for_status()

    output = json.loads(response.text)
    return output["return"]
