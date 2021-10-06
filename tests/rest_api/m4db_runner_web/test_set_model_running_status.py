import unittest

from m4db_serverside.rest_api.m4db_runner_web.set_model_running_status import set_model_running_status


class TestSetModelRunningStatus(unittest.TestCase):

    def test_set_model_running_status(self):
        set_model_running_status("8b0fe9f1-fb74-451b-a420-0d0d3619b3a0", "finished")

