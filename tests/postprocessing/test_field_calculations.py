import unittest

from m4db_serverside.postprocessing.field_calculations import tec_to_unstructured_grid
from m4db_serverside.postprocessing.field_calculations import write_vorticity_helicity_adm_to_tecplot
from m4db_serverside.postprocessing.field_calculations import write_vorticity_helicity_adm_to_vtk
from m4db_serverside.postprocessing.field_calculations import net_quantities


class TestFieldCalculations(unittest.TestCase):

    def test_net_quantities(self):
        ug = tec_to_unstructured_grid("../test_data/tecplot/magnetization.tec")
        quants = net_quantities(ug)
        print(quants)

    def test_write_vorticity_helicity_adm_to_tecplot(self):
        ug = tec_to_unstructured_grid("../test_data/tecplot/magnetization.tec")
        write_vorticity_helicity_adm_to_tecplot(ug, "../test_data/tecplot/magnetization_plus_old.tec")

    def test_write_vorticity_helicity_adm_to_vtk(self):
        ug = tec_to_unstructured_grid("../test_data/tecplot/magnetization.tec")
        write_vorticity_helicity_adm_to_vtk(ug, "../../test_data/tecplot/magnetization_plus.vtu")


if __name__ == "__main__":
    unittest.main()
