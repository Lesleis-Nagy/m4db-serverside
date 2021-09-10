import unittest

from m4db_serverside.parsers.merrill_parser import parse_merrill_stdout


class TestMerrillStdOutParser(unittest.TestCase):
    def test_normal_operation(self):
        with open("../test_data/merrill_output/normal_model_stdout.txt", "r") as fin:
            stdout_data = fin.read()
        parsed_data = parse_merrill_stdout(stdout_data)
        print(parsed_data)


if __name__ == "__main__":
    unittest.main()
