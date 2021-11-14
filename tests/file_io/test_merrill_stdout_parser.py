import unittest

from m4db_serverside.file_io.merrill_stdio import read_merrill_model_stdout
from m4db_serverside.file_io.merrill_stdio import extract_path_data
from m4db_serverside.file_io.merrill_stdio import extract_path_type
from m4db_serverside.file_io.merrill_stdio import count_path_fails_and_minimized


class TestMerrillStdoutParser(unittest.TestCase):

    def test_merrill_stdout_parser(self):
        with open("../../../test_data/merrill_output/model_stdout.txt", "r") as fin:
            lines = fin.readlines()
        output = read_merrill_model_stdout(lines)
        print(output)

    def test_extract_path_data(self):
        data = extract_path_data("../../../test_data/neb/neb_stdout1.txt")
        print(data)

    def test_extract_path_type(self):
        type = extract_path_type("../../../test_data/neb/neb_stdout1.txt")
        print(type)

        type = extract_path_type("../../../test_data/neb/neb_stdout2.txt")
        print(type)

    def test_count_path_fails_and_minimized(self):
        n_fails, n_mins = count_path_fails_and_minimized("../../../test_data/neb/neb_stdout1.txt")
        print(f"No. of fails: {n_fails} and no. of mins: {n_mins}")

        n_fails, n_mins = count_path_fails_and_minimized("../../../test_data/neb/neb_stdout2.txt")
        print(f"No. of fails: {n_fails} and no. of mins: {n_mins}")

        n_fails, n_mins = count_path_fails_and_minimized("../../../test_data/merrill_output/model_stdout.txt")
        print(f"No. of fails: {n_fails} and no. of mins: {n_mins}")