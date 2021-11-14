import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_neb_start_end_unique_ids import get_neb_start_end_unique_ids


class TestGetNEBStartEndUniqueIds(unittest.TestCase):

    def test_get_neb_start_end_unique_ids(self):
        start_uid, end_uid = get_neb_start_end_unique_ids("2fac7c2f-f55c-4f2a-b468-75ca5ce0c4ed")
        print(start_uid)
        print(end_uid)
