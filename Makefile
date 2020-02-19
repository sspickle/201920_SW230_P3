SDIR = ./src
CPC=g++
CC=gcc

BDIR = ./build
PDIR = ./psrc
TDIR = ./test

CFLAGS= -Wall -ggdb -I$(SDIR) -fPIC -std=c11 -D_POSIX_C_SOURCE=200809L
CPFLAGS= -Wall -ggdb -I$(SDIR) -fPIC -std=c++11
GSL_LIBS= -lgsl -lgslcblas -lm

DEPS = $(SDIR)/impl.h
PSRCS = $(PDIR)/cimpl.pyx $(PDIR)/setup.py
TOBJ = $(BDIR)/impl.o $(BDIR)/test_impl.o 
MOBJ = $(BDIR)/impl.o $(BDIR)/main.o

$(BDIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(MKDIR_P) $(dir $@)
	$(CC) -c -o $@ $< $(CFLAGS)

$(BDIR)/%.o: $(TDIR)/%.cpp $(DEPS)
	$(MKDIR_P) $(dir $@)
	$(CPC) -c -o $@ $< $(CPFLAGS)

$(BDIR)/test_executable: $(TOBJ)
	$(CPC) $(TOBJ) -g -pthread $(GSL_LIBS) -lgtest_main -lgtest -o $(BDIR)/test_executable

$(BDIR)/main_exe: $(MOBJ)
	$(CC) $(MOBJ) $(GSL_LIBS) -o $(BDIR)/main_exe

test: $(BDIR)/test_executable
	$(BDIR)/test_executable --gtest_print_time=0

vtest: $(BDIR)/test_executable
	valgrind --leak-check=full $(BDIR)/test_executable --gtest_print_time=0

main: $(BDIR)/main_exe
	$(BDIR)/main_exe

.PHONY: clean

clean:
	rm -rf $(BDIR) *~ core $(SDIR)/*~ *.so psrc/cimpl.c $(PDIR)/*~ $(PDIR)/static/*~ $(PDIR)/templates/*~

py:$(OBJS) $(PSRCS) $(TOBJ)
	python3 psrc/setup.py build_ext -i

py_install:$(TOBJ) $(PSRCS) py
	python3 psrc/setup.py install

ptest: $(TOBJ) $(PSRCS) py
	python3 -m pytest -v psrc/tests/*.py /work

lint:
	cat src/*.c src/*.h > foo1.txt
	clang-format src/*.c src/*.h > foo2.txt
	diff -u foo2.txt foo1.txt; (ret=$$?; rm -f foo1.txt foo2.txt && exit $$ret)

lint-fix:
	clang-format -i src/*.c src/*.h

submit: 
	git commit -m "final submission" -a
	git push

MKDIR_P ?= mkdir -p
