import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_software_executable import get_software_executable


class TestGetSoftwareExecutable(unittest.TestCase):

    def test_get_software_executable(self):
        print(get_software_executable("merrill", "1.4.0"))
