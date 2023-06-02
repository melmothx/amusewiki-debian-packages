# Copyright 2002 FUKUI Rei
# 
# This program may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.2
# of this license or (at your option) any later version.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.2 or later is part of all distributions of LaTeX 
# version 1999/12/01 or later.
# 
# This program consists of all files listed in Manifest.txt.
#
# Makefile for TIPA installation.
#
# You need to edit PREFIX.

#PREFIX=/usr/local/share/texmf
PREFIX=/usr/local/teTeX/share/texmf

TEXDIR=$(PREFIX)/tex/latex/tipa
FONTDIR=$(PREFIX)/fonts
MAPDIR=$(PREFIX)/dvips/config

all : 

install :
	-mkdir -p $(TEXDIR)
	chmod 755 $(TEXDIR)
	-mkdir -p $(FONTDIR)/source/fkr/tipa
	chmod 755 $(FONTDIR)/source/fkr $(FONTDIR)/source/fkr/tipa
	-mkdir -p $(FONTDIR)/tfm/fkr/tipa
	chmod 755 $(FONTDIR)/tfm/fkr $(FONTDIR)/tfm/fkr/tipa
	-mkdir -p $(FONTDIR)/type1/fkr/tipa
	chmod 755 $(FONTDIR)/type1/fkr $(FONTDIR)/type1/fkr/tipa
	install -c -m 644 sty/*.sty sty/*.fd sty/*.def $(TEXDIR)
	install -c -m 644 mf/*.mf mf/*.def mf/*.sh $(FONTDIR)/source/fkr/tipa
	install -c -m 644 tfm/*.tfm $(FONTDIR)/tfm/fkr/tipa
	install -c -m 644 type1/*.pfb $(FONTDIR)/type1/fkr/tipa
	-install -c -m 644 type1/*.afm $(FONTDIR)/type1/fkr/tipa
	-mkdir -p $(MAPDIR)
	chmod 755 $(MAPDIR)
	install -c -m 644 dvips/tipa.map $(MAPDIR)
	-mktexlsr

man :
	cd doc; latex tipaman; bibtex tipaman; latex tipaman; latex tipaman

clean :
	(cd doc; rm -f *~ *.log *.aux *.dvi *.blg *.toc)
	(cd sty; rm -f *~ *.log *.aux *.dvi *.blg)
	(cd mf; rm -f *~ ti*gf ti*pk ti*.tfm ti*.log xi*gf xi*pk xi*.tfm xi*.log)
	(cd type1; rm -f *.afm)
