r"""
A selection of utilities used for changing user passwords.
"""

from m4db_database.orm import DBUser

from m4db_serverside.utilities.password import password_hash


def change_password_admin(session, user_name, new_password):
    r"""
    An administrative routine that may be used to change an existing user's password.
    :param session: a database session.
    :param user_name: the name of the user for which the password should be changed.
    :param new_password: the new password for the user.
    :return: None
    """
    db_user = session.query(DBUser).filter(DBUser.user_name == user_name).one()

    db_user.password = password_hash(new_password)

    session.commit()


def change_password_user(session, user_name, old_password, new_password):
    r"""
    A user routine that may be used to change an existing user's password.
    :param session: a database session.
    :param user_name: the name of the user for which the password should be changed.
    :param old_password: the old password.
    :param new_password: the new password for the user.
    :return: None
    """
    db_user = session.query(DBUser).filter(DBUser.user_name == user_name).one()

    if db_user.password != password_hash(old_password):
        raise ValueError("Attempted to change password for user '{}', old passwords don't match".format(user_name))

    db_user.password = password_hash(new_password)

    session.commit()
