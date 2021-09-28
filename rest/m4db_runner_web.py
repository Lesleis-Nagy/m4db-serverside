import falcon

from m4db_database.sessions import get_session

from m4db_serverside.rest.middleware import SQLAlchemySessionManager

from m4db_serverside.rest.m4db_runner_web.alive import Alive

Session = get_session(scoped=True, echo=False)

app = falcon.API(
    middleware=[
        SQLAlchemySessionManager(Session)
    ]
)

# Alive service.
alive = Alive()
app.add_route(
    '/alive', alive
)
