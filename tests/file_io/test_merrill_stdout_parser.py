import unittest

from m4db_serverside.file_io.merrill_stdio import read_merrill_stdout


class TestMerrillStdoutParser(unittest.TestCase):

    def test_merrill_stdout_parser(self):
        with open("../../../test_data/merrill_output/model_stdout.txt", "r") as fin:
            lines = fin.readlines()
        output = read_merrill_stdout(lines)
        print(output)