import unittest

from m4db_database.orm import Model
from m4db_database.orm import NEB

from m4db_database.configuration import read_config_from_environ
from m4db_database.sessions import get_session

from m4db_serverside.script_gen.slurm_script import slurm_model_script
from m4db_serverside.script_gen.slurm_script import slurm_neb_script


class TestSlurmScriptGeneration(unittest.TestCase):

    def setUp(self) -> None:
        self.config = read_config_from_environ()

    def test_slurm_model_script(self):
        session = get_session()
        model = session.query(Model).filter(Model.unique_id == "0ce1a86b-f823-461e-9b40-98e89542ea8c").one()
        script = slurm_model_script(model, self.config)

        print(script)

    def test_slurm_neb_script(self):
        session = get_session()
        neb = session.query(NEB).filter(NEB.unique_id == "c47328f0-11d1-45b4-9cf4-9fb4a83b4672").one()
        script = slurm_neb_script(neb, self.config)

        print(script)


if __name__ == "__main__":
    unittest.main()
