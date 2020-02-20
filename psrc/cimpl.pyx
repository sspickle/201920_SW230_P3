# cython: language_level=3, boundscheck=False

cdef extern from "gsl/gsl_sf_bessel.h":
    double gsl_sf_bessel_J0 (double x);

cdef extern from "impl.h":
    double myBesselFunc(double x)
    
cdef float myFloatBessel(float x):
    return gsl_sf_bessel_J0(x)

cdef long double myLongDBessel(long double x):
    return gsl_sf_bessel_J0(x)

def call_gsl_bessel_J0(x):
    return gsl_sf_bessel_J0(x)

def call_myBessel(x):
    return myBesselFunc(x)

#
# Next let's build a ufunc version:
#
# https://github.com/stefanv/teaching/tree/master/2010_scipy_numpy_kittens_dragons/src/ufunc
#

include "numpy_ufuncs.pxi"

ubessel = register_ufunc_fdg(myFloatBessel, myBesselFunc, myLongDBessel,
    "ubessel", "bessel J0 function", PyUFunc_None)
