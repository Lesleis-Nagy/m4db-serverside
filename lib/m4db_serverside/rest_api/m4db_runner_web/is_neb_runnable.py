r"""
An API call that will check whether an NEB is runnable (i.e. if it is parentless or its parent has completed).
"""
import json

from m4db_database.configuration import read_config_from_environ

from m4db_serverside.rest_api.sessions import get_session


def is_neb_runnable(unique_id):
    r"""
    Test to see whether an NEB is runnable.
    :param unique_id: the unique ID of the neb.
    :return: True if the NEB is runnable, otherwise False.
    """
    config = read_config_from_environ()
    service_url = "https://{host:}:{port:}/is_neb_runnable".format(
        host=config["m4db_runner_web"]["host"],
        port=config["m4db_runner_web"]["port"]
    )
    session = get_session()
    response = session.post(service_url, data=json.dumps({"unique_id": unique_id}), verify=False)
    response.raise_for_status()

    output = json.loads(response.text)

    return output["return"]
