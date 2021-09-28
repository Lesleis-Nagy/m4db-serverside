import sys

import yaml

from m4db_database.orm.latest import DBUser
from m4db_database.orm.latest import Project

from m4db_database.sessions import get_session


def create_new_config(args):
    r"""
    Create a new configuration file.
    :param args: command line arguments.
    :return: None
    """
    # If we're ignoring the existence of args.db_user and args.project in m4db.
    if args.force:
        ss_config = {
            "db_user": args.db_user,
            "project": args.project
        }
        with open(args.config_file, "w") as fout:
            yaml.dump(ss_config, fout, default_flow_style=False)
        return

    # If we're verifying the existence of args.db_user and args.project
    session = get_session(nullpool=True)

    user = session.query(DBUser).filter(DBUser.user_name == args.db_user).one_or_none()
    if user is None:
        print("The user: '{}' could not be found".format(args.db_user))
        session.close()
        sys.exit(1)

    project = session.query(Project).filter(Project.name == args.project).one_or_none()
    if project is None:
        print("The project: '{}' could not be found.".format(args.project))
        session.close()
        sys.exit(1)

    session.close()

    ss_config = {
        "db_user": args.db_user,
        "project": args.project
    }
    with open(args.config_file, "w") as fout:
        yaml.dump(ss_config, fout, default_flow_style=False)

    return
