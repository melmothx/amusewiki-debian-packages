# $Id: Makefile 976 2026-01-19 22:40:55Z karl $
# GNU makefile for pdfTeX documentation.  Public domain.

texfot = texfot
pdflatex = $(texfot) pdflatex --file-line-error

tinydoc = incl/pdfmin
help_msg = incl/pdftex-help.txt
syntax_summary = incl/pdftex-syntax.tex

# dependencies for building the manual.
deps = pdftex.tex pdftexmanual.cls \
       $(syntax_summary) $(help_msg) $(tinydoc)-crop.pdf

a4run = $(pdflatex) '\PassOptionsToClass{a4paper}{report} \input $<'
ltrun = $(pdflatex) '\PassOptionsToClass{letterpaper}{report} \input $<'

rerun_pattern = ^LaTeX Warning:.*Rerun to get

default: pdftex-a.pdf
all: pdftex-a.pdf pdftex-l.pdf

pdftex-a.pdf: $(deps)
	rm -f $@
	$(a4run)
	while grep '$(rerun_pattern)' pdftex.log; do $(a4run); done
	mv pdftex.pdf $@

pdftex-l.pdf: $(deps)
	rm -f $@
	$(ltrun)
	while grep $(rerun_pattern) pdftex.log >/dev/null; do $(ltrun); done
	mv pdftex.pdf $@

# Run when making new manual for release; by hand, since it's too
# irritating to depend on the binary.
pdftex-help $(help_msg):
	$(pdftex_binary) --help >$(help_msg)
	(echo; echo; echo) >>$(help_msg)
	$(pdftex_binary) --version >>$(help_msg)
	
# Primitives and syntax, in TeX for the printed manual.
$(syntax_summary): pdftex.tex syntaxform.pl
	perl syntaxform.pl pdftex.tex >$(syntax_summary) || rm -f $@

# We want to typeset the PDF for a tiny input file. This should be
# updated every year:
# - update version numbers.
# - make new binary in source tree.
# - run make frontispiece.
# - ensure result still fits on one page.
# (Also, unrelated but also yearly, run make pdftex-help.)
#
pdftex_binary = ../../source/build-pdftex/texk/web2c/pdftex
texdist_fonts = /usr/local/texlive/dev/texmf-dist/fonts
#
$(tinydoc)-src.pdf: $(tinydoc)-src.tex
	env KPATHSEA_WARNING=0 TEXFONTS=$(texdist_fonts)// \
	  $(pdftex_binary) -ini -output-directory=incl '$<'

# The title page PDF as TeXable text.
$(tinydoc)-src.txt: $(tinydoc)-src.pdf #GNUmakefile
	test -s $<
	cat $< \
	| expand \
	| grep -v '^$$' \
	| fmt -s -w45 \
	| expand >$@ || rm -f $@
	wc -l $@  # set titlepagelines=half this plus one:

# Convert that TeXt to PDF.
$(tinydoc)-fmt.pdf: $(tinydoc)-fmt.tex $(tinydoc)-src.txt
	context $< >$(tinydoc)-fmt.fot 2>&1
	test -s `basename $@`
	mv `basename $(tinydoc)`-fmt.* incl/

tinyfinal = $(tinydoc)-crop
frontispiece $(tinyfinal).pdf: $(tinydoc)-fmt.pdf
	pdfcrop $< $(tinyfinal).pdf
	npages=`pdfinfo $(tinyfinal).pdf | awk '$$1=="Pages:" {print $$2}'`; \
	  test $$npages = 1

#  Install from this source directory to TL.

# svn co svn://u:pw@tug.org/texlive/trunk/Master/texmf-dist/doc/pdftex
tltree = /home/texlive/karl/Master/texmf-dist
dest = $(tltree)/doc/pdftex/manual/

INSTALL_DATA = cp -p

install:
	$(INSTALL_DATA) ChangeLog Makefile README $(dest)
	$(INSTALL_DATA) pdftex-a.pdf pdftex.tex pdftexmanual.cls $(dest)
	$(INSTALL_DATA) incl/*.txt incl/*.tex incl/pdfmin-crop.pdf $(dest)/incl
	$(INSTALL_DATA) syntaxform.pl $(dest)


#  clean.
clean:
	rm -f *.aux *.log *.out *.toc
	rm -f incl/*.fot incl/*.log incl/*.tuc
	rm -f incl/pdftex-syntax.tex

maintainer-clean: clean
	rm -f pdftex-a.pdf pdftex-l.pdf
	rm -f incl/pdftex-help.txt incl/*.pdf

clobber allclean realclean distclean: maintainer-clean

spell:
	dw <pdftex.tex | grep -v cmr10; true
	myspell pdftex.tex
