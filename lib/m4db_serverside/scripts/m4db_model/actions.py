r"""
Perform various actions.
"""
import os
import json
import sys

from m4db_database.sessions import get_session

from m4db_serverside.db.model.create import create_model


def add_model_action(args):
    r"""
    Create a new model from input piped from stdin.
    :param args: additional command line arguments.
    :return:
    """
    session = get_session(nullpool=True)

    try:
        # If the user hasn't supplied an input JSON file with model data ...
        if args.json_file is None:
            # ... attempt to read from stdin
            json_str = sys.stdin.read()
            json_model_list = json.loads(json_str)
        else:
            # ... otherwise check the file exists, open & read it
            if not os.path.isfile(args.json_file):
                raise FileNotFoundError("The file '{}' could not be found".format(args.json_file))
            with open(args.json_file, "r") as fin:
                json_str = fin.read()
                json_model_list = json.loads(json_str)

        # If 'json_model_list' is actually a python dictionary ...
        if isinstance(json_model_list, dict):
            # ... put it in a list
            json_model_list = [json_model_list]

        unique_ids = []
        for json_model_dict in json_model_list:
            unique_ids += create_model(
                session,
                json_model_dict,
                args.db_user,
                args.project,
                args.software,
                args.software_version,
                max_evals=args.max_evals,
                reps=args.reps)

        # Return the unique ids of the models we've added.
        return unique_ids
    finally:
        session.close()
