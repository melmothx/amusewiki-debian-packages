# $Id: Makefile 777 2017-04-20 23:08:32Z karl $
# Public domain.

include ../Common.mak

default: test-mapwarn

test-mapwarn:
	$(prog) test-mapwarn.tex; test $$? = 1 # pdftex should exit 1

clean:
	$(clean)
