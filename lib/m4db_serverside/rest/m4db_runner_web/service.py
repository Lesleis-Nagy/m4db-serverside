import falcon

from m4db_database.sessions import get_session

from m4db_serverside.rest.middleware import SQLAlchemySessionManager

from m4db_serverside.rest.m4db_runner_web.is_alive import IsAlive
from m4db_serverside.rest.m4db_runner_web.set_model_running_status import SetModelRunningStatus
from m4db_serverside.rest.m4db_runner_web.set_model_quants import SetModelQuants
from m4db_serverside.rest.m4db_runner_web.get_model_merrill_script import GetModelMerrillScript

from m4db_serverside.rest.m4db_runner_web.set_neb_running_status import SetNEBRunningStatus
from m4db_serverside.rest.m4db_runner_web.is_neb_runnable import IsNEBRunnable
from m4db_serverside.rest.m4db_runner_web.get_neb_merrill_script import GetNEBMerrillScript

Session = get_session(scoped=True, echo=False)

app = falcon.API(
    middleware=[
        SQLAlchemySessionManager(Session)
    ]
)

# IsAlive service.
is_alive = IsAlive()
app.add_route(
    '/is_alive', is_alive
)

# Model: set running status service.
set_model_running_status = SetModelRunningStatus()
app.add_route(
    "/set_model_running_status", set_model_running_status
)

# Model: set quants service.
set_model_quants = SetModelQuants()
app.add_route(
    "/set_model_quants", set_model_quants
)

# Model: get merrill model script.
get_model_merrill_script = GetModelMerrillScript()
app.add_route(
    "/get_model_merrill_script/{unique_id}", get_model_merrill_script
)

# NEB: set running status service.
set_neb_running_status = SetNEBRunningStatus()
app.add_route(
    "/set_neb_running_status", set_neb_running_status
)

# NEB: query if an NEB is runnable.
is_neb_runnable = IsNEBRunnable()
app.add_route(
    "/is_neb_runnable", is_neb_runnable
)

# NEB: get merrill neb script.
get_neb_merrill_script = GetNEBMerrillScript()
app.add_route(
    "/get_neb_merrill_script/{unique_id}", get_neb_merrill_script
)
