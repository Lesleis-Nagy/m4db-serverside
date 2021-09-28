r"""
Create a command line parser to handle input for a model runner utility script.
"""

from argparse import ArgumentParser


def command_line_parser():
    r"""
    Create a command line parser to handle mode runner actions.
    Returns: a command line parser
    """
    parser = ArgumentParser()

    parser.add_argument("unique_id", help="The unique ID of the model to run")
    parser.add_argument("--force", action="store_true", help="Flag to run the model regardless of running status")

    return parser
