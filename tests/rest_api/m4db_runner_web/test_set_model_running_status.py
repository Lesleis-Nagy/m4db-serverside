import unittest

from m4db_serverside.rest_api.m4db_runner_web.set_model_running_status import set_model_running_status


class TestSetModelRunningStatus(unittest.TestCase):

    def test_set_model_running_status(self):
        set_model_running_status("e75aa284-0889-4f19-b0cd-0efb2c914737", "not-run")
