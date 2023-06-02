# $Id: Makefile 772 2017-03-16 22:58:04Z karl $
# Public domain.

include ../Common.mak

default: test-normal test-omit-mediabox

test-normal:
	$(prog) test-normal.tex
	grep -q /MediaBox.*314 test-normal.pdf 

test-omit-mediabox:
	$(prog) test-omit-mediabox.tex
	grep -q /MediaBox.*271 test-omit-mediabox.pdf   # should be there
	! grep -q /MediaBox.*314 test-omit-mediabox.pdf # should not

clean:
	$(clean)
