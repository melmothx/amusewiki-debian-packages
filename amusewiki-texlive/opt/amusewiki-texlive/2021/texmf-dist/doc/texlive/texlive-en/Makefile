# $Id: Makefile 61734 2022-01-25 17:27:53Z karl $
# Makefile for TeX Live documentation.  Public domain.
doc = texlive-en

all: pdf html

tlpre = # possible prefix to run from the pretest
env = TEXINPUTS=.:../texlive-en:../texlive-common:; export TEXINPUTS; $(tlpre)

pdflatex_opts =  --file-line-error
pdflatex = pdflatex $(pdflatex_opts) '\nonstopmode\def\Status{1}\input $(doc)'

# The story here is that for HTML, we just want <img> tags referring to
# the graphics (in ../texlive-common), without specifying any size,
# since their natural size is ok (enough). But LaTeX's \includegraphics
# requires a size (htlatex runs latex, not pdflatex, so it can't
# determine the size for .png files), and tex4ht passes that warning on,
# which is just an annoyance. We could generate .xbb files, but then
# we'd have to update them every year, which seems like a waste of time
# when we don't want a size in the first place.
# 
texfot_pdf = texfot
texfot_html = texfot --ignore="Cannot determine size of graphic" \
                     --ignore='File.*\.xbb\"'

pdf:
	rm -f *.aux *.toc *.lof *.lot *.xref* *.tmp *.out
	$(env) $(texfot_pdf) $(pdflatex)
	$(env) $(texfot_pdf) $(pdflatex)
	$(env) $(texfot_pdf) $(pdflatex)
	$(env) $(texfot_pdf) $(pdflatex)

# It is best to use the htlatex wrapper since then we can easily specify
# these options; using \Preamble in live4ht.cfg is not equivalent.
# 
# The options here:
# live4ht - reads our live4ht.cfg.
# info - extra debugging info.
# xhtml - required for html5.
# html5 - output viewport decl to help on small screens.
# charset - UTF-8 is more likely to work well than Latin 1.
# fn-in - keep footnotes in the main output file.
# 
# The other argument, where we pass, -cunihtf -utf8, goes along with the
# charset and tells tex4ht to look for Unicode font encodings. See
# https://tug.org/tex4ht.
# 
htopts1 = "live4ht,info,xhtml,html5,charset=utf-8,fn-in"
htopts2 = " -cunihtf -utf8"
run_htlatex = $(env) $(texfot_html) htlatex $(doc) $(htopts1) $(htopts2) </dev/null
html:
	rm -f *.aux *.toc *.lof *.lot *.xref* *.tmp *.out
	$(run_htlatex)
	ls -l texlive-??.html texlive-??.css

# This is the old way, no longer used.
html-separate:
	rm -f *.aux *.toc *.lof *.lot *.xref* *.tmp *.out *.4tc
# this sequence is equivalent to running "ht latex $(doc)".  We do it
# this way so we can \def\Status for the \ifcase in tex-live.sty.
	$(env) latex '\nonstopmode\def\Status{2`}\input $(doc)'
	$(env) latex '\nonstopmode\def\Status{2}\input $(doc)'
	$(env) latex '\nonstopmode\def\Status{2}\input $(doc)'
	$(env) latex '\nonstopmode\def\Status{2}\input $(doc)'
	$(env) tex4ht $(doc)
	$(env) t4ht $(doc)

# just run tex once without cleaning temp files.
pdf1 p:
	$(env) $(texfot_pdf) $(pdflatex)

# ditto for html.
html1 h:
	$(run_htlatex)

clean:
	rm -f *.aux *.log *.blg *.toc *.out *.lot tex4ht.ps *.4*
	rm -f *.xref* *.lg *.idv *.out *.otc *.tmp tmp.*
	rm -f $(doc).dvi $(doc).ps

realclean: clean
	rm -f $(doc).pdf
	rm -f *.html *.htm $(doc).css *.gif *.jpg

spell:
	cat texlive-??.tex \
	| aspell list --mode=tex --add-extra-dicts=`pwd`/.dict.pws  \
	| sort -f -u

svr:
	svn revert texlive-??.css texlive-??.html texlive-??.pdf
	svn status
