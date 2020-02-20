
SWEN 230: Project 3, Jupyter Notebook & the GNU GSL
===================================================

This file is formatted in [markdown](https://daringfireball.net/projects/markdown/). You can render this file into HTML using pandoc, or any online markdown renderer (e.g., [stackedit](https://stackedit.io/app#), [dillinger](https://dillinger.io) or similar) or you can use an editor with markdown support (e.g., VS Code, BBEdit, etc.).

SWEN 230 Project 3 is all about learning how to create a python interface for a C library. The Libary we're using is GNU GSL:

[GNU GSL](https://www.gnu.org/software/gsl/doc/html/index.html)

To complete this project you'll need to add one or more functions to those already in
the header file [`src/impl.h`](src/impl.h) and the source file [`src/impl.c`](src/impl.c)
The function(s) should call on GSL functions to perform a mathematical calculations.
Also, be sure to add tests to ensure your function(s) are operating correctly.

Once you've added your function(s) you need to also provide a python interface [`psrc/cimpl.pyx`](psrc/cimpl.pyx)
so it/they can be accessed through a jupyter notebook. We'll be exploring how to do this
in the coming two weeks.

Finally, create a new python notebook like ["ExampleNotebook.ipynb"](ExampleNotebook.ipynb) that exercises your function.

You can use Docker to get started. First build the docker image `sw230`:

    docker build -t sw230 .

Then compile the C sources & python wrapper:

    docker-compose run p3 make py

Finally launch the jupyter notebook server:
    
    docker-compose up
    
