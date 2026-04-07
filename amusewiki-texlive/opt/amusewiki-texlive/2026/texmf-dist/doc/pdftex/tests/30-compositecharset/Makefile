# $Id: Makefile 910 2023-08-26 17:47:24Z karl $
# Public domain. /CharSet not including composite base, for some fonts.

texfot = texfot

pln:
	$(texfot) pdftex compositechars.tex
	grep -a /CharSet compositechars.pdf

plt:
	$(texfot) pdflatex compositechars.tex
	grep -a /CharSet compositechars.pdf

llt:
	$(texfot) lualatex compositechars.tex
	grep -a /CharSet compositechars.pdf

ltx:
	$(texfot) latex compositechars.tex
	dvitype compositechars.dvi >typ
