import unittest

from m4db_serverside.file_io.patran import read_patran


class TestTecplotLoader(unittest.TestCase):

    def test_one_submesh(self):
        result = read_patran("../../test_data/patran/100nm.pat")
        print(result)


    def test_two_submeshes(self):
        result = read_patran("../../test_data/patran/cubo_120nm_ripple.pat")
        print(result)


if __name__ == "__main__":
    unittest.main()
