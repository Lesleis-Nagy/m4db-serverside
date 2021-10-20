import falcon

from m4db_database.sessions import get_session

from m4db_serverside.rest.middleware import SQLAlchemySessionManager

from m4db_serverside.rest.m4db_readonly_web.get_model_tecplot_file import GetModelTecplotFile
from m4db_serverside.rest.m4db_readonly_web.get_model_tecplot_file import GetModelTecplotFileZip
from m4db_serverside.rest.m4db_readonly_web.get_model_tecplot_file import GetModelJSONFile
from m4db_serverside.rest.m4db_readonly_web.get_model_tecplot_file import GetModelJSONFileZip

from m4db_serverside.rest.m4db_readonly_web.get_running_statuses import GetRunningStatuses

from m4db_serverside.rest.m4db_readonly_web.get_software_items import GetSoftwareItems

from m4db_serverside.rest.m4db_readonly_web.get_projects import GetProjects

from m4db_serverside.rest.m4db_readonly_web.get_geometry import GetGeometryNames
from m4db_serverside.rest.m4db_readonly_web.get_geometry import GetGeometrySizes

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

# Service to get a model tecplot file as a zip.
get_model_tecplot_file_zip = GetModelTecplotFileZip()
app.add_route(
    "/model/tecplot/zip/{unique_id}", get_model_tecplot_file_zip
)

# Service to get a model JSON file.
get_model_json_file = GetModelJSONFile()
app.add_route(
    "/model/json/{unique_id}", get_model_json_file
)

# Service to get a zipped model JSON file.
get_model_json_file_zipped = GetModelJSONFileZip()
app.add_route(
    "/model/json/zip/{unique_id}", get_model_json_file_zipped
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

# Service to get running statuses
get_running_statuses = GetRunningStatuses()
app.add_route(
    "/running-statuses", get_running_statuses
)

# Service to get software items.
get_software_items = GetSoftwareItems()
app.add_route(
    "/software-items", get_software_items
)

# Service to get projects.
get_projects = GetProjects()
app.add_route(
    "/projects", get_projects
)

# Service to get geometry names.
get_geometry_names = GetGeometryNames()
app.add_route(
    "/geometry-names", get_geometry_names
)

# Service to get geometry sizes.
get_geometry_sizes = GetGeometrySizes()
app.add_route(
    "/geometry-sizes/{geometry_name}", get_geometry_sizes
)
