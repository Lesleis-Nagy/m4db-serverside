r"""
A service to check if an NEB path has a parent or not.
"""

import json

from m4db_database.orm.latest import NEB


class IsNEBParentless:

    def on_get(self, req, resp, unique_id):
        r"""
        Return True if the NEB has a parent, otherwise false.
        :param req: the request object.
        :param resp: the response object.
        :param unique_id: the unique identifier of an NEB.
        :return: None
        """
        neb = self.session.query(NEB).\
            filter(NEB.unique_id == unique_id).one()

        if neb.parent_neb is None:
            # The NEB is parentless.
            return_value = True
        else:
            return_value = False

        resp.text = json.dumps({"return": return_value})
