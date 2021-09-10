import unittest

from m4db_database.orm import Model
from m4db_database.orm import NEB

from m4db_database.configuration import read_config_from_environ
from m4db_database.sessions import get_session

from m4db_serverside.script_gen.merrill_script import merrill_model_script
from m4db_serverside.script_gen.merrill_script import merrill_model_energies_script
from m4db_serverside.script_gen.merrill_script import merrill_neb_root_script
from m4db_serverside.script_gen.merrill_script import merrill_neb_child_script


class TestMerrillScriptGeneration (unittest.TestCase):

    def setUp(self) -> None:
        self.config = read_config_from_environ()

    def test_merrill_model_script(self):
        session = get_session()
        model = session.query(Model).filter(Model.unique_id == "0ce1a86b-f823-461e-9b40-98e89542ea8c").one()
        script = merrill_model_script(model, self.config)

        print(script)

    def test_merrill_model_energies_script(self):
        session = get_session()
        model = session.query(Model).filter(Model.unique_id == "0ce1a86b-f823-461e-9b40-98e89542ea8c").one()
        script = merrill_model_energies_script(model, self.config)

        print(script)

    def test_merrill_root_path(self):
        session = get_session()
        neb = session.query(NEB).filter(NEB.unique_id == "81d45982-563e-47c4-8a51-3e277751ab7f").one()
        script = merrill_neb_root_script(neb, self.config)

        print(script)

    def test_merrill_child_path(self):
        session = get_session()
        neb = session.query(NEB).filter(NEB.unique_id == "c47328f0-11d1-45b4-9cf4-9fb4a83b4672").one()
        script = merrill_neb_child_script(neb, self.config)

        print(script)

    def test_merrill_energies(self):
        session = get_session()


if __name__ == "__main__":
    unittest.main()
