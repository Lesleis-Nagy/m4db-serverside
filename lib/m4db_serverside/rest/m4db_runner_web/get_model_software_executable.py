r"""
A service to retrieve the software executable associated with a model.
"""

from m4db_database.orm.latest import Model


class GetModelSoftwareExecutable:

    def on_get(self, req, resp, unique_id):
        r"""
        Get the executable associated with a model.
        :param req: request object.
        :param resp: response object.
        :param unique_id: the unique identifier of an NEB.
        :return: None
        """
        model = self.session.query(Model).\
            filter(Model.unique_id == unique_id).one()

        resp.body = model.mdata.software.executable
