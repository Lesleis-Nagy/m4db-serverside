from argparse import ArgumentParser


def command_line_parser():
    parser = ArgumentParser()

    parser.add_argument("db_user", help="the name of the default m4db user.")
    parser.add_argument("project", help="the name of the default m4db project.")
    parser.add_argument("config_file", help="the name of the configuration file.")
    parser.add_argument("--force", action="store_true", help="don't verify whether 'db_user' or 'project' exist.")

    return parser
