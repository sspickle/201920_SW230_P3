from distutils.core import setup, Extension
from Cython.Build import cythonize

setup(name='p3_impl',
      version='1.0',
      ext_modules = cythonize(Extension("p3_impl", ["psrc/cimpl.pyx"],
                                        extra_objects=["build/impl.o"],                                        
                                        include_dirs=["src/."],
                                        libraries=["gsl", "gslcblas", "m"],
                                        )))
