import unittest

from m4db_serverside.file_io.tecplot import read_tecplot


class TestTecplotLoader(unittest.TestCase):

    def test_normal_operation(self):
        result = read_tecplot("../../test_data/tecplot/magnetization.tec")
        print(result)


if __name__ == "__main__":
    unittest.main()
