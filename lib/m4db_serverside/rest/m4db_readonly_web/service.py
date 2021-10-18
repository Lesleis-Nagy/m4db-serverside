import falcon

from m4db_database.sessions import get_session

from m4db_serverside.rest.middleware import SQLAlchemySessionManager

from m4db_serverside.rest.m4db_readonly_web.get_model_tecplot_file import GetModelTecplotFile

from m4db_serverside.rest.m4db_readonly_web.get_neb_tecplot_file import GetNebTecplotFile
from m4db_serverside.rest.m4db_readonly_web.get_neb_path_energies import GetNEBPathEnergiesCSV

Session = get_session(scoped=True, echo=False)

app = falcon.App(
    middleware=[
        SQLAlchemySessionManager(Session)
    ]
)

# Service to get model tecplot file.
get_model_tecplot_file = GetModelTecplotFile()
app.add_route(
    "/model/tecplot/{unique_id}", get_model_tecplot_file
)

# Service to get NEB tecplot file.
get_neb_tecplot_file = GetNebTecplotFile()
app.add_route(
    "/neb/tecplot/{unique_id}", get_neb_tecplot_file
)

# Service to get NEB path energy data as a csv file.
get_neb_path_energies_csv = GetNEBPathEnergiesCSV()
app.add_route(
    "/neb/path/csv/{unique_id}", get_neb_path_energies_csv
)

