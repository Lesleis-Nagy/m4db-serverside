import unittest

from m4db_serverside.rest_api.m4db_runner_web.set_neb_running_status import set_neb_running_status


class TestSetNEBRunningStatus(unittest.TestCase):

    def test_set_neb_running_status(self):
        set_neb_running_status("92089a80-ad8d-4ca9-bb05-82b460fccce7", "not-run")
