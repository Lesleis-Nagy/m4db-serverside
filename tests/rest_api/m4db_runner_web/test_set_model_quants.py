import unittest

from m4db_serverside.rest_api.m4db_runner_web.set_model_quants import set_model_quants


class TestSetModelQuants(unittest.TestCase):

    def test_set_model_quants(self):
        set_model_quants(
            "8b0fe9f1-fb74-451b-a420-0d0d3619b3a0",
            mx_tot=1.0, my_tot=2.0, mz_tot=3.0, vx_tot=4.0, vy_tot=5.0, vz_tot=6.0, h_tot=7.0, rh_tot=8.0, adm_tot=9.0,
            e_typical=10.0, e_anis=11.0, e_ext=12.0, e_demag=13.0, e_exch1=14.0, e_exch2=15.0, e_exch3=16.0,
            e_exch4=17.0, e_tot=18.0, volume=19.0)
