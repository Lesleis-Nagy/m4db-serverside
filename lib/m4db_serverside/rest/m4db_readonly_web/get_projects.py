r"""
A service to retrieve all the projects on m4db.
"""

import json

from m4db_database.orm.latest import Project


class GetProjects:
    r"""
    Falcon service to retrieve projects.
    """

    def on_get(self, req, resp):
        r"""
        Retrieve project information.
        :param req: Falcon request object.
        :param resp: Falcon response object.
        :return:
        """
        projects = self.session.query(Project).all()

        response = []
        for project in projects:
            response.append({
                "name": project.name,
                "description": project.description
            })

        resp.body = json.dumps(response)
