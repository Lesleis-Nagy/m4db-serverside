r"""
A selection of actions that will execute a model.
"""

import m4db_serverside.runner.model.run_model as ssrunner


def run_model(args):
    r"""
    Run a model.
    :param args: program command line arguments.
    :return: None
    """
    ssrunner.run_model(args.unique_id)
