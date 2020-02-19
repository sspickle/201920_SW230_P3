# cython: language_level=3, boundscheck=False

cdef extern from "gsl/gsl_sf_bessel.h":
    double gsl_sf_bessel_J0 (double x);

cdef extern from "impl.h":
    double myBesselFunc(double x)

def call_gsl_bessel_J0(x):
    return gsl_sf_bessel_J0(x)

def call_myBessel(x):
    return myBesselFunc(x)

