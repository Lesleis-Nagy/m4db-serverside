r"""
A selection of utility routines for dealing with passwords.
"""

from hashlib import md5

from m4db_database.configuration import read_config_from_environ


def salted_password_format():
    r"""
    Return the salted password format
    """
    return "{password:}{salt:}"


def password_hash(password, salt=None):
    r"""
    Take the password and produce a hash from it, if `salt` is set to None, then attempt to read the salt from
    configuration data.
    Args:
        password: the password
        salt: the password salt (optional)
    Returns: the hash of the password.
    """
    # If salt is set to None ...
    if salt is None:
        # ... attempt to create the password-salt pair using information from m4db_database configuration.
        config = read_config_from_environ()
        salted_password = salted_password_format().format(
            password=password,
            salt=str(config["authentication_salt"] if "authentication_salt" in config.keys() else None)
        )
    else:
        # ... otherwise use the salt given
        salted_password = salted_password_format().format(
            password=password,
            salt=salt
        )
    return md5(salted_password.encode('ascii')).hexdigest()
