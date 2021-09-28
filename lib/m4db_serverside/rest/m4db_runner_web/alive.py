r"""
A very simple service that can be used to check that m4db_runner_web is 'alive'.
"""

import falcon


class Alive:
    r"""
    A REST service that may be used to test whether the server is alive.
    """

    def on_get(self, req, resp):
        r"""
        The 'get' http request handler.
        """
        resp.status = falcon.HTTP_200
        return
