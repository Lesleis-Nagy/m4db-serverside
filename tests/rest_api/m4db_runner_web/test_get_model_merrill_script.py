import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_model_merrill_script import get_model_merrill_script


class TestGetModelMerrillScript(unittest.TestCase):

    def test_get_model_merrill_script(self):
        get_model_merrill_script("e75aa284-0889-4f19-b0cd-0efb2c914737", "script.merrill")
