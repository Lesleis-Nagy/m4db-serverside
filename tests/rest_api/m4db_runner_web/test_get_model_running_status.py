import unittest

from m4db_serverside.rest_api.m4db_runner_web.get_model_running_status import get_model_running_status


class TestGetModelRunningStatus(unittest.TestCase):

    def test_get_model_running_status(self):
        response = get_model_running_status("8b0fe9f1-fb74-451b-a420-0d0d3619b3a0")
        print(response)

        response = get_model_running_status("26e49717-7360-431a-89b3-94a2418c2ca9")
        print(response)

        response = get_model_running_status("97f58f68-3df5-4b6c-8031-f3440ef1fa6e")
        print(response)

        response = get_model_running_status("f8e344d2-a6b4-4658-8b2b-fb5ce3bdef8c")
        print(response)

        response = get_model_running_status("265d459d-f4dc-4fc6-bfa4-2d4d383d2a6d")
        print(response)

        response = get_model_running_status("0b3f6cfa-88d1-4cf1-b004-f96719ad82a6")
        print(response)



