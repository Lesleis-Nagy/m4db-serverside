import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_neb_merrill_script import get_neb_merrill_script


class TestGetNEBMerrillScript(unittest.TestCase):

    def test_get_model_merrill_script_without_parent(self):
        get_neb_merrill_script("92089a80-ad8d-4ca9-bb05-82b460fccce7", "neb_no_parent.merrill")

    def test_get_model_merrill_script_with_parent(self):
        get_neb_merrill_script("c066e1b3-e560-43da-adcb-fbc90783b3aa", "neb_with_parent.merrill")
