r"""
A collection of Falcon services to retrieve software data.
"""

import json

from m4db_database.orm.latest import Software


class GetSoftwareItems:
    r"""
    Falcon service to retrieve all the software data managed by m4db.
    """

    def on_get(self, req, resp):
        r"""
        Retrieve software information.
        :param req: Falcon request object.
        :param resp: Falcon response object.
        :return: None
        """
        software_items = self.session.query(Software).all()

        response = []
        for software_item in software_items:
            response.append({
                "name": software_item.name,
                "version": software_item.version,
                "description": software_item.description
            })

        resp.body = json.dumps(response)
