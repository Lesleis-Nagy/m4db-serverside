from argparse import ArgumentParser

import m4db_database.configuration


def add_common_subparser_args(subparser):
    r"""
    Add some common arguments for each subparser (so that we don't repeat code)
    :param subparser:
    :return:
    """
    config = m4db_database.configuration.read_config_from_environ()

    # Set config
    software = config["m4db_serverside"]["default_micromag_software"]
    software_version = config["m4db_serverside"]["default_micromag_software_version"]

    subparser.add_argument("--software", default=software, type=str,
                           help="override the current micromagnetics software (default: {})".format(software))
    subparser.add_argument("--software-version", default=software_version, type=str,
                           help="override the current micromagnetics software version (default: {})".format(
                           software_version))

    # If ss_config was found ...
    db_user = config["m4db_serverside"]["default_m4db_user"]
    project = config["m4db_serverside"]["default_m4db_project"]
    subparser.add_argument("--db-user", default=db_user,
                           help="override the default m4db user (default: '{}')".format(db_user))
    subparser.add_argument("--project", default=project,
                           help="override the default m4db project (default: '{}')".format(project))


def add_from_json_subparser(subparsers):
    r"""
    Add subparser to deal with adding new models to m4db.
    :param subparsers: the subparsers objects.
    :return: the "new_model" subparser.
    """
    subparser = subparsers.add_parser(
        "add-from-json",
        help="Adds a new model or models to m4db."
    )

    subparser.add_argument("--max-evals", type=int,
                           help="the maximum no. of energy evaluations for the model",
                           default=100000)
    subparser.add_argument("--reps", type=int,
                           help="the number of repetitions per model entry",
                           default=1)
    subparser.add_argument("--json-file",
                           help="a JSON file containing model information to add to m4db (otherwise use stdin).")

    add_common_subparser_args(subparser)

    return subparser


def command_line_parser():
    r"""
    Create a command line parser to handle model actions.
    :return: a command line parser
    """
    parser = ArgumentParser()

    subparsers = parser.add_subparsers(dest="command")

    add_from_json_subparser(subparsers)

    return parser
