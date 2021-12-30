# $Id: Makefile 793 2018-01-25 23:21:29Z karl $
# Public domain.

include ../Common.mak

default: test-ok

test-ok:
	$(prog) test-fontobjnum.tex
	grep 'fontobjnum=1' test-fontobjnum.log >/dev/null

clean:
	$(clean)
