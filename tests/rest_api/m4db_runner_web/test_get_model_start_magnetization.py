import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_model_start_magnetization import get_model_start_magnetization


class TestIsNEBParentless(unittest.TestCase):

    def test_get_model_start_magnetization(self):
        uid = "0c1c680b-fd9d-43f7-abcc-0a4acc40df84"
        rval = get_model_start_magnetization(uid)
        print(f"'{uid}' start model: {rval}")

        uid = "1e64a258-0fed-4ed1-a935-79d64036cf7e"
        rval = get_model_start_magnetization(uid)
        print(f"'{uid}' start model: {rval}")
