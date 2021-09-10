from argparse import ArgumentParser

import m4db_database.configuration
import m4db_serverside.configuration


def new_model_subparser(subparsers):
    r"""
    Add subparser to deal with adding new models to m4db.
    :param subparsers: the subparsers objects.
    :return: the "new_model" subparser.
    """
    subparser = subparsers.add_parser(
        "add",
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

    return subparser


def command_line_parser():
    r"""
    Create a command line parser to handle model actions.
    :return: a command line parser
    """
    parser = ArgumentParser()

    subparsers = parser.add_subparsers(dest="command")

    new_model_subparser(subparsers)

    config = m4db_database.configuration.read_config_from_environ()
    ss_config = m4db_serverside.configuration.read_config_from_environ()

    # Set config
    parser.add_argument("--software", default=config["mm_type"],
                        help="override the current micromagnetics software (default: {})".format(config["mm_type"]))
    parser.add_argument("--software-version", default=config["mm_binary_version"],
                        help="override the current micromagnetics software version (default: {})".format(
                            config["mm_binary_version"]))

    # If ss_config was found ...
    if ss_config is not None:
        # ... set db_user & project to the values read from the config file.
        db_user = ss_config["db_user"]
        project = ss_config["project"]
    else:
        # ... otherwise set the db_user & project to None - the user must then specify these.
        db_user = None
        project = None

    parser.add_argument("--db-user", default=db_user,
                        help="override the default m4db user (default: '{}')".format(db_user))
    parser.add_argument("--project", default=project,
                        help="override the default m4db project (default: '{}')".format(project))

    return parser
