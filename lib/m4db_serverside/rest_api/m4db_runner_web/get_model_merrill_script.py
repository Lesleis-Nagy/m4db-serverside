r"""
An API call that will retrieve a MERRILL model script.
"""

from m4db_database.configuration import read_config_from_environ

from m4db_serverside.rest_api.sessions import get_session


def get_model_merrill_script(unique_id, output_file):
    r"""
    Retrieve a MERRILL script that may be used to run a model.
    :param unique_id: the unique ID of a model.
    :param output_file: the destination to which the MERRILL script is saved.
    :return: None.
    """
    config = read_config_from_environ()
    service_url = "https://{host:}:{port:}/get_model_merrill_script/{unique_id:}".format(
        host=config["m4db_runner_web"]["host"],
        port=config["m4db_runner_web"]["port"],
        unique_id=unique_id
    )
    session = get_session()
    response = session.get(service_url, verify=False)
    response.raise_for_status()
    with open(output_file, "bw") as fout:
        fout.write(response.content)
