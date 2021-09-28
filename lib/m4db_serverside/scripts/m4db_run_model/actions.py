r"""
A selection of actions that will execute a model.
"""
import json
import requests

from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry

from m4db_database.configuration import read_config_from_environ


def set_model_status(unique_id, status):
    service_url = "http://clyne/set_model_status"
    config = read_config_from_environ()

    session = requests.Session()
    retries = Retry(
        total=config["m4db_runner_web"]["no_of_retries"],
        backoff_factor=config["m4db_runner_web"]["backoff_factor"],
        status_forcelist=[502, 503, 504]
    )
    session.mount("http://", HTTPAdapter(max_retries=retries))

    session.post(service_url, data=json.dumps({
        "unique_id": unique_id,
        "status": status
    }))


def set_model_quants(unique_id,
