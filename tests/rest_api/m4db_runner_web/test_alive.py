import unittest

from m4db_serverside.rest_api.m4db_runner_web.is_alive import is_alive


class TestAlive(unittest.TestCase):

    def test_alive(self):
        print(is_alive())
