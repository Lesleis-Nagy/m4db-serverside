r"""
A service to check whether an NEB is runnable.
"""
import json

from m4db_database.orm.latest import RunningStatus
from m4db_database.orm.latest import NEB


class IsNEBRunnable:
    def on_post(self, req, resp):
        r"""
        Find out if an NEB is runnable, i.e. if it has no parents or if it has a parent that has been run.
        :param req: request object.
        :param resp: response object.
        :return: None
        """

        parameters = req.media

        finished_running_id, = self.session.query(RunningStatus.id).\
            filter(RunningStatus.name == "finished").one()

        # Retrieve the NEB.
        neb = self.session.query(NEB).\
            filter(NEB.unique_id == parameters["unique_id"]).one()

        if neb.parent_neb is None:
            # The NEB has no parent and so it is runnable.
            resp.body = json.dumps({"return": True})
        else:
            # The NEB has a parent, so retrieve it
            parent = neb.parent_neb

            # Check that the parent is 'finished' ...
            if parent.running_status_id == finished_running_id:
                # If the parent is 'finished' then the NEB is runnable.
                resp.body = json.dumps({"return": True})
            else:
                # If the parent is not 'finished' then it is not runnable.
                resp.body = json.dumps({"return": False})
