import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_model_merrill_script import get_model_merrill_script


class TestGetModelMerrillScript(unittest.TestCase):

    def test_get_model_merrill_script(self):
        get_model_merrill_script("8b0fe9f1-fb74-451b-a420-0d0d3619b3a0", "scripts.merrill")
