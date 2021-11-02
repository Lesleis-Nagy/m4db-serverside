r"""
Perform various neb related actions.
"""
from m4db_database.sessions import get_session

from m4db_serverside.db.neb.create import create_fs_path
from m4db_serverside.db.neb.create import create_neb_child_path
from m4db_serverside.db.neb.create import create_fs_path_with_neb_child


def add_fs_path_action(args):
    kwargs = vars(args)

    with get_session(nullpool=True) as session:
        neb_unique_id, was_new = create_fs_path(session, **kwargs)
        if was_new:
            print(f"Created parent NEB with unique ID: {neb_unique_id}")
        else:
            print(f"Parent NEB with given start/end points already exists (unique ID: {neb_unique_id})")


def add_neb_child_path_action(args):
    kwargs = vars(args)

    with get_session(nullpool=True) as session:
        neb_unique_id = create_neb_child_path(session, **kwargs)
        print(f"Created (child) NEB with unique ID: {neb_unique_id}")


def add_fs_path_with_neb_child_action(args):
    kwargs = vars(args)

    with get_session(nullpool=True) as session:
        parent_unique_id, child_unique_id = create_fs_path_with_neb_child(session, **kwargs)
        print(f"Created (parent) NEB with unique ID: {parent_unique_id}, along with")
        print(f"NEB (child) with unique ID: {child_unique_id}")
