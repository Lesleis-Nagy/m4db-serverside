import unittest

from m4db_serverside.rest_api.m4db_runner_web.set_model_quants import set_model_quants


class TestSetModelQuants(unittest.TestCase):

    def test_set_model_quants(self):
        output = set_model_quants("e75aa284-0889-4f19-b0cd-0efb2c914737", mx_tot=1.11111)
        print(output)


