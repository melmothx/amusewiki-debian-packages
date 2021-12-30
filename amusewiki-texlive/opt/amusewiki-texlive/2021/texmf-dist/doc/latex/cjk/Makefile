# Copyright (C) 1994-2021  Werner Lemberg <wl@gnu.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program in doc/COPYING; if not, write to the Free
# Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
# MA 02110-1301 USA

# You need GNU make to run this Makefile.
#
# Some issues:
#
# o This Makefile is intended to build the distribution tarballs only,
#   not to compile binaries.
#
# o Binaries of the CJK utility programs (and the standard tex stuff,
#   including dvipdfmx) must work.
#
# o GNU extensions of various utility programs are used.
#
# o emacs 22 (or newer) and the `cweave' program from the `c2cweb'
#   package, renamed to `cweavex', are needed.
#
# o The TeXLive version of some font definition files are used (in the
#   `texlive' subdirectory).

version=4.8.5

distdir=cjk-$(version)
abs-distdir=$(shell pwd)/$(distdir)

DISTDIRS=$(shell find . -type d | grep -v .git | grep -v $(distdir))

# expected: subdirs `dvi' and `cjk'
CJK2DVI=\
  (cd dvi; \
   TEXINPUTS=$(abs-distdir)/{texlive,texinput//,contrib/wadalab,utils/pyhyphen}: \
   TFMFONTS=$(abs-distdir)/utils/thaifont/texmf/fonts/tfm//: \
     texi2dvi -l latex ../cjk/$@.cjk; \
   rm -f $@.aux $@.log $@.toc)

# LATEX2DVI srcdir targetdir
# expected: targetdir/dvi
LATEX2DVI=\
  cp $(1)/$@.tex $(2)/dvi; \
  (cd $(2)/dvi; \
   TEXINPUTS=$(abs-distdir)/{texlive,texinput//,contrib/wadalab,utils/pyhyphen}: \
   TFMFONTS=$(abs-distdir)/utils/thaifont/texmf/fonts/tfm//: \
     texi2dvi -l latex $@.tex; \
   rm -f $@.tex $@.aux $@.log $@.toc)

# DVI2PDF paper-format
# expected: subdir `pdf' and `dvi'
DVI2PDF=\
  dvipdfmx -v -p $(1) -o pdf/$@.pdf dvi/$@.dvi
  

# CONVERT converter srcdir targetdir [paper-format]
CONVERT=\
  cd $(distdir); \
  $(1) < $(2)/$@.tex > $(3)/cjk/$@.cjk; \
  cd $(3); \
  $(CJK2DVI); \
  $(if $(4),$(call DVI2PDF,$(4)),$(call DVI2PDF,letter))

# MULE srcdir targetdir [paper-format]
MULE=\
  cd $(distdir); \
  emacs --batch \
        --load utils/lisp/emacs/cjk-enc.el \
        --funcall batch-cjk-write-file \
        $(1)/$@.tex; \
  mv $(1)/$@.cjk $(2)/cjk; \
  cd $(2); \
  $(CJK2DVI); \
  $(if $(3),$(call DVI2PDF,$(3)),$(call DVI2PDF,letter))

# LATEX srcdir targetdir [paper-format]
LATEX=\
  cd $(distdir); \
  $(call LATEX2DVI,$(1),$(2)); \
  cd $(2); \
  $(if $(3),$(call DVI2PDF,$(3)),$(call DVI2PDF,letter))


DISTTARGETS=\
  READMEb5 \
  READMEgb \
  Big5 \
  Big5vert \
  CEF_test \
  CJKbabel \
  CJKfntef \
  CJKutf8 \
  CJKspace \
  CJKmixed \
  GB \
  JIS \
  KS \
  SJIS \
  UTF8 \
  muletest \
  pytest \
  py_test \
  rubytest \
  thai \
  thai_utf8 \
  c90


all:
	@echo
	@echo "    Say \`make dist' to build the tarballs."
	@echo


READMEb5:
	$(call CONVERT,bg5conv,doc/chinese,doc,a4)
READMEgb:
	$(call LATEX,doc/chinese,doc)
Big5 Big5vert:
	$(call CONVERT,bg5conv,examples,examples)
CEF_test:
	$(call CONVERT,cefconv,examples,examples)
SJIS:
	$(call CONVERT,sjisconv,examples,examples)
CJKbabel muletest rubytest thai thai_utf8:
	$(call MULE,examples,examples)
GB JIS KS UTF8 py_test CJKfntef CJKutf8 CJKspace CJKmixed:
	$(call LATEX,examples,examples)
pytest:
	$(call LATEX,utils/pyhyphen,examples)
c90:
	(cd $(abs-distdir)/utils/thaifont/tools; \
	 ln -s c90.etx c90.tex)
	$(call LATEX,utils/thaifont/tools,doc)


dist: distsrc predistdoc distdoc

distsrc:
	-rm -rf $(distdir)
	rm -f $(distdir).tar.gz
	rm -f $(distdir)-doc.tar.gz
	mkdir $(distdir)
	srcdir=`pwd`; \
	for d in $(DISTDIRS); do \
	  mkdir -p $(distdir)/$$d; \
	  (cd $(distdir)/$$d; \
	   f=`find $$srcdir/$$d -maxdepth 1 -type f`; \
	   test -z "$$f" || ln -s $$f . || true); \
	done
	for f in `find $(abs-distdir)/utils -name '*.w'`; do \
	  ctangle $$f - `echo $$f | sed s/w$$/c/`; \
	done
	tar -H ustar -chf - $(distdir) | gzip -9 -c > $(distdir).tar.gz

predistdoc:
	mkdir -p $(distdir)/doc/{cjk,dvi,pdf}
	mkdir -p $(distdir)/examples/{cjk,dvi,pdf}
	mkdir -p $(distdir)/doc/man/{dvi,html,pdf,txt}
	echo "This directory contains files which are \`preprocessed' with" \
	  > $(distdir)/doc/cjk/README
	echo "cjk-enc.el, bg5conv, etc." \
	  >> $(distdir)/doc/cjk/README
	echo \
	  >> $(distdir)/doc/cjk/README
	echo "You can feed them directly into LaTeX." \
	  >> $(distdir)/doc/cjk/README

distdoc: $(DISTTARGETS) manpages cweb
	for f in `find $(distdir) -type l`; do \
	  rm $$f; \
	done
	for f in `find $(distdir) -name '*.c'`; do \
	  rm $$f; \
	done
	-for d in `find $(distdir) -depth -type d`; do \
	  rmdir --ignore-fail-on-non-empty $$d; \
	done
	tar -H ustar -chf - $(distdir) | gzip -9 -c > $(distdir)-doc.tar.gz
	rm -rf $(distdir)

manpages:
	for f in `find utils -type f -name '*.1'`; do \
	  groff -ww -Tdvi -dpaper=letter -P-pletter -mec -man -rS11 $$f > \
	    $(abs-distdir)/doc/man/dvi/`basename $$f .1`.dvi; \
	  groff -ww -Tps -dpaper=letter -P-pletter -man -rS11 $$f | \
	    ps2pdf - $(abs-distdir)/doc/man/pdf/`basename $$f .1`.pdf; \
	  groff -ww -Tlatin1 -man -P-bcu $$f > \
	    $(abs-distdir)/doc/man/txt/`basename $$f .1`.txt; \
	  groff -ww -Thtml -man $$f > \
	    $(abs-distdir)/doc/man/html/`basename $$f .1`.html; \
	done

cweb:
	for f in `find utils -type f -name '*.w'`; do \
	  cp $$f $(abs-distdir)/doc/dvi; \
	  (cd $(abs-distdir)/doc/dvi; \
	   F=`basename $$f .w`; \
	   cweavex +a $$F.w; \
	   tex $$F; \
	   rm -rf $$F.idx $$F.log $$F.scn $$F.tex $$F.toc $$F.w; \
	   dvipdfmx -v -p letter -o ../pdf/$$F.pdf $$F); \
	done

# EOF
