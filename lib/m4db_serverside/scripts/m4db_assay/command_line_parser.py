from argparse import ArgumentParser


def general_subparser(subparsers):
    r"""
    Add a subparser to deal with the 'general' command.
    :param subparsers: the subparsers object.
    :return: a subparser.
    """
    subparser = subparsers.add_parser(
        "general",
        help="Provide general assay statistics and display them."
    )
    return subparser


def command_line_parser():
    r"""
    Create a command line parser to handle user actions.
    :return: a command line parser.
    """
    parser = ArgumentParser()

    subparsers = parser.add_subparsers(dest="command")

    general_subparser_obj = general_subparser(subparsers)

    return parser
