import unittest

from m4db_serverside.rest_api.m4db_runner_web.is_neb_parent_blocking import is_neb_parent_blocking


class TestIsNEBRunnable(unittest.TestCase):

    def test_is_neb_runnable(self):
        output = is_neb_parent_blocking("92089a80-ad8d-4ca9-bb05-82b460fccce7")
        print(output)
