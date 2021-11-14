import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_neb_parent_unique_id import get_neb_parent_unique_id


class TestIsNEBParentless(unittest.TestCase):

    def test_is_neb_parentless(self):
        uid = "2fac7c2f-f55c-4f2a-b468-75ca5ce0c4ed"
        rval = get_neb_parent_unique_id(uid)
        print(f"'{uid}' parent: {rval}")

        uid = "bf578a0e-de2b-4099-983a-18e1ea3bec54"
        rval = get_neb_parent_unique_id(uid)
        print(f"'{uid}' parent: {rval}")
