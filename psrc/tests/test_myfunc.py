import sys
import os

sys.path.append(sys.argv[1])

import p3_impl

class TestMyFunc:

    def test_myfunc(self):
        assert p3_impl.call_myBessel(5) == p3_impl.call_gsl_bessel_J0(5)

