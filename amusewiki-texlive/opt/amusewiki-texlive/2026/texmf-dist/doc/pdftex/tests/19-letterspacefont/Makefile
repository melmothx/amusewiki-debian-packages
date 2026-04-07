include ../Common.mak

prog = $(pdftex2) -fmt pdfetex

test:
	$(prog) ./f.tex

test2:
	$(prog)  ./f2.tex

fmt:
	$(pdftex2) -ini '*pdfetex.ini'

clean:
	$(clean)
