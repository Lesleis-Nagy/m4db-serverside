import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_model_software_executable import get_model_software_executable


class TestGetModelSoftwareExecutable(unittest.TestCase):
    def test_get_model_software_executable(self):
        print(get_model_software_executable("8b0fe9f1-fb74-451b-a420-0d0d3619b3a0"))
