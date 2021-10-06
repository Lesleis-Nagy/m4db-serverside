import unittest

from m4db_serverside.file_io.patran import read_patran

from m4db_serverside.utilities.geometry import geometry_volume
from m4db_serverside.utilities.geometry import geometry_edge_stats


class TestGeometryUtilities(unittest.TestCase):

    def test_geometry_volume_single_domain(self):
        file_name = "../../test_data/patran/100nm.pat"
        geometry_data = read_patran(file_name)
        volume = geometry_volume(geometry_data)
        print("volume of '{}' is {}".format(file_name, volume))

    def test_geometry_volume_multidomain(self):
        file_name = "../../test_data/patran/cubo_120nm_ripple.pat"
        geometry_data = read_patran(file_name)
        volume = geometry_volume(geometry_data)
        print("volume of '{}' is {}".format(file_name, volume))

    def test_geometry_stats_single_domain(self):
        file_name = "../../test_data/patran/100nm.pat"
        geometry_data = read_patran(file_name)
        stats = geometry_edge_stats(geometry_data)
        print("stats for '{}' are {}".format(file_name, stats))

    def test_geometry_stats_multidomain(self):
        file_name = "../../test_data/patran/cubo_120nm_ripple.pat"
        geometry_data = read_patran(file_name)
        stats = geometry_edge_stats(geometry_data)
        print("stats for '{}' are {}".format(file_name, stats))


if __name__ == "__main__":
    unittest.main()
