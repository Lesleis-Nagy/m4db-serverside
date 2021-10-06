import unittest

from subprocess import Popen, PIPE

from m4db_database.sessions import get_session_from_args

from m4db_database.data_defaults import create_units
from m4db_database.data_defaults import create_running_statuses
from m4db_database.data_defaults import create_anisotropy_forms
from m4db_database.data_defaults import create_size_conventions
from m4db_database.data_defaults import create_materials

from m4db_database.orm.latest import Unit
from m4db_database.orm.latest import DBUser
from m4db_database.orm.latest import SizeConvention
from m4db_database.orm.latest import Geometry
from m4db_database.orm.latest import Software
from m4db_database.orm.latest import Model
from m4db_database.orm.latest import ModelMaterialsText
from m4db_database.orm.latest import RandomField
from m4db_database.orm.latest import RunningStatus
from m4db_database.orm.latest import ModelRunData
from m4db_database.orm.latest import ModelReportData
from m4db_database.orm.latest import Metadata
from m4db_database.orm.latest import Project
from m4db_database.orm.latest import Material
from m4db_database.orm.latest import ModelMaterialAssociation

from m4db_serverside.db.model.retrieve import get_models


class TestRetrieve(unittest.TestCase):

    def setUp(self):
        self.test_db = "m4dbtest"

        # Create a brand new test database.
        cmd = "echo 'drop database if exists {test_db:}; create database {test_db:}' | psql -d postgres".format(
            test_db=self.test_db
        )
        process = Popen(
            cmd, stdout=PIPE, stderr=PIPE, shell=True, text=True, universal_newlines=True
        )
        stdout, stderr = process.communicate()
        print(stdout)
        print(stderr)

        # Add some data to the new database.
        session = get_session_from_args(db_type="postgres", db_name=self.test_db, create=True)

        create_units(session)
        create_running_statuses(session)
        create_anisotropy_forms(session)
        create_size_conventions(session)
        create_materials(session, materials=["iron", "magnetite"])

        micron = session.query(Unit).filter(Unit.symbol == "um").one()
        esvd = session.query(SizeConvention).filter(SizeConvention.symbol == "ESVD").one()
        not_run = session.query(RunningStatus).filter(RunningStatus.name == "not-run").one()
        magnetite_20 = session.query(Material).\
            filter(Material.name == "magnetite").filter(Material.temperature == 20.0).one()
        iron_20 = session.query(Material).\
            filter(Material.name == "iron").filter(Material.temperature == 20.0).one()

        trelis = Software(
            name="Trelis",
            version="1.1.1"
        )
        session.add(trelis)

        merrill = Software(
            name="merrill",
            version="2.2.2."
        )
        session.add(merrill)

        user = DBUser(
            user_name="testuser",
            password="passpass",
            first_name="Test",
            surname="User",
            email="test@user.com",
            ticket_length=1800,
            access_level=10
        )
        session.add(user)

        project = Project(
            name="testproject",
            description="A project for testing"
        )
        session.add(project)

        #########################
        # Geometries            #
        #########################

        geom1_unique_id = "90f6f996-b9e0-4f41-89a8-f1a748c39e0a"
        geom1 = Geometry(
            unique_id=geom1_unique_id,
            name="geom1",
            size=0.100,
            size_unit=micron,
            size_convention=esvd,
            nelements=1, nvertices=2, nsubmeshes=3, volume_total=4
        )
        session.add(geom1)

        #########################
        # Models                #
        #########################

        # Model 1

        model1_unique_id = "90f6f996-b9e0-4f41-89a8-f1a748c39e0a"

        model1_materials_text = ModelMaterialsText(
            materials="magnetite,iron",
            submeshidxs_materials="1:magnetite,2:iron",
            submeshidxs_materials_temperatures="1:magnetite:20.000,2:iron:20.000"
        )
        session.add(model1_materials_text)

        model1 = Model(
            unique_id=model1_unique_id,
            geometry=geom1,
            model_materials_text=model1_materials_text,
            start_magnetization=RandomField(),
            running_status=not_run,
            model_run_data=ModelRunData(),
            model_report_data=ModelReportData(),
            mdata=Metadata(
                db_user=user,
                software=merrill,
                project=project
            ),
            materials=[
                ModelMaterialAssociation(
                    submesh_id=1,
                    material=magnetite_20
                ),
                ModelMaterialAssociation(
                    submesh_id=2,
                    material=iron_20
                )
            ]
        )
        session.add(model1)

        # Model 2

        model2_unique_id = "3cd2cb50-0dd3-4f9c-9ef0-b36ff89fdd3b"

        model2_materials_text = ModelMaterialsText(
            materials="magnetite",
            submeshidxs_materials="1:magnetite",
            submeshidxs_materials_temperatures="1:magnetite:20.000"
        )
        session.add(model2_materials_text)

        model2 = Model(
            unique_id=model2_unique_id,
            geometry=geom1,
            model_materials_text=model2_materials_text,
            start_magnetization=RandomField(),
            running_status=not_run,
            model_run_data=ModelRunData(),
            model_report_data=ModelReportData(),
            mdata=Metadata(
                db_user=user,
                software=merrill,
                project=project
            ),
            materials=[
                ModelMaterialAssociation(
                    submesh_id=1,
                    material=magnetite_20
                )
            ]
        )
        session.add(model2)

        # Model 3

        model3_unique_id = "b5e7c755-e7f6-4849-91dd-ff479403e400"

        model3_materials_text = ModelMaterialsText(
            materials="iron",
            submeshidxs_materials="1:iron",
            submeshidxs_materials_temperatures="1:iron:20.000"
        )
        session.add(model3_materials_text)

        model3 = Model(
            unique_id=model3_unique_id,
            geometry=geom1,
            model_materials_text=model3_materials_text,
            start_magnetization=RandomField(),
            running_status=not_run,
            model_run_data=ModelRunData(),
            model_report_data=ModelReportData(),
            mdata=Metadata(
                db_user=user,
                software=merrill,
                project=project
            ),
            materials=[
                ModelMaterialAssociation(
                    submesh_id=1,
                    material=iron_20
                )
            ]
        )
        session.add(model3)

        session.commit()

    def test_hello(self):
        # Add some data to the new database.
        session = get_session_from_args(db_type="postgres", echo=True, db_name=self.test_db)

        models = get_models(
            session, materials=["iron", "magnetite"], temperature=30.0
        )

        for index, model in enumerate(models):
            print("MODEL {}".format(index+1))
            print(model.as_dict())


