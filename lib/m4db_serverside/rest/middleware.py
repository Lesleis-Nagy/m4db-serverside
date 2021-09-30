r"""
A collection of routines for managing Falcon middleware.
"""


class SQLAlchemySessionManager:
    """
    Create a scoped database session for every request and close it when the request
    ends.
    """

    def __init__(self, Session):
        self.Session = Session

    def process_resource(self, req, resp, resource, params):
        resource.session = self.Session()

    def process_response(self, req, resp, resource, req_succeeded):
        if hasattr(resource, 'session'):
            self.Session.remove()
