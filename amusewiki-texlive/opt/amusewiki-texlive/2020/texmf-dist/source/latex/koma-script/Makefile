# ======================================================================
# Makefile
# Copyright (c) Markus Kohm, 2002-2020
#
# This file is part of the LaTeX2e KOMA-Script bundle.
#
# This work may be distributed and/or modified under the conditions of
# the LaTeX Project Public License, version 1.3c of the license.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.3c or later is part of all distributions of LaTeX 
# version 2005/12/01 or later and of this work.
#
# This work has the LPPL maintenance status "author-maintained".
#
# The Current Maintainer and author of this work is Markus Kohm.
#
# This work consists of all files listed in manifest.txt.
# ----------------------------------------------------------------------
# Makefile
# Copyright (c) Markus Kohm, 2002-2020
#
# Dieses Werk darf nach den Bedingungen der LaTeX Project Public Lizenz,
# Version 1.3c, verteilt und/oder veraendert werden.
# Die neuste Version dieser Lizenz ist
#   http://www.latex-project.org/lppl.txt
# und Version 1.3c ist Teil aller Verteilungen von LaTeX
# Version 2005/12/01 oder spaeter und dieses Werks.
#
# Dieses Werk hat den LPPL-Verwaltungs-Status "author-maintained"
# (allein durch den Autor verwaltet).
#
# Der Aktuelle Verwalter und Autor dieses Werkes ist Markus Kohm.
# 
# Dieses Werk besteht aus den in manifest.txt aufgefuehrten Dateien.
# ======================================================================

NOCHANGELOG = 1 # We do not longer make or package the ChangeLog

# ----------------------------------------------------------------------
# All directories with Makefiles
export BASEDIR ?= $(PWD)/
SUBDIRS = doc
# ----------------------------------------------------------------------
# Load common rules
include Makefile.baserules
# Load variable definitions
include Makefile.baseinit
# ----------------------------------------------------------------------
# Temporary folder, used to create distribution.
# Same folder with postfix "-maintain" will be used to create maintain-
# distribution.
export DISTDIR	   := $(PWD)/koma-script-$(ISODATE)
export MAINTAINDIR := $(DISTDIR)-maintain
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# More than once used:
# Make implementation documentation
define makepdffromdtx
	if ! $(LATEX) $(NONSTOPMODE) $(PDFOUTPUT) $<; then \
	    $(RM) -v $@; \
	    exit 1; \
	fi
        oncemore=true; \
        checksum=`$(CKSUM) $(basename $<).aux`; \
        while $$oncemore; \
	do \
	    if ! $(MKINDEX) $(basename $<) \
	       || ! $(LATEX) $(NONSTOPMODE) $(PDFOUTPUT) $<; then \
	        $(RM) -v $@; \
	        exit 1; \
	    fi; \
	    $(GREP) Rerun $(basename $<).log || oncemore=false; \
	    newchecksum=`$(CKSUM) $(basename $<).aux`; \
	    [ "$$newchecksum"="$$checksum" ] || oncemore=true; \
	    checksum="$$newchecksum"; \
	done
endef
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# List of all Makefiles
MAKE_FILES	= Makefile Makefile.baserules Makefile.baseinit
# ----------------------------------------------------------------------
# make classes, packages, etc.
CLS_MAIN	= scrbook.cls \
		  scrreprt.cls \
		  scrartcl.cls \
		  scrlttr2.cls \
		  scrreport.cls \
		  scrarticle.cls \
		  scrletter.cls \
		  scrletter.sty \
		  typearea.sty \
		  scrsize10pt.clo \
		  scrsize11pt.clo \
		  scrsize12pt.clo \
		  scrlfile.sty \
	   	  scrwfile.sty \
		  scrbase.sty \
		  scrkbase.sty \
		  scraddr.sty \
		  scrtime.sty \
		  scrdate.sty \
		  scrjura.sty \
		  tocbasic.sty \
		  tocstyle.sty \
		  scrextend.sty \
		  scrhack.sty \
		  float.hak \
		  floatrow.hak \
		  hyperref.hak \
		  listings.hak \
		  nomencl.hak \
		  setspace.hak \
		  lscape.hak \
		  standardsections.hak \
		  scrfontsizes.sty \
		  visualize.lco \
	          DIN.lco \
		  DINmtext.lco \
		  DIN5008A.lco \
		  DIN5008B.lco \
		  SN.lco \
	 	  SNleft.lco \
		  KOMAold.lco \
		  NF.lco \
		  UScommercial9.lco \
		  UScommercial9DW.lco \
		  NipponEH.lco \
		  NipponEL.lco \
		  NipponLH.lco \
		  NipponLL.lco \
		  NipponRL.lco \
		  KakuLL.lco \
		  scrlayer.sty \
		  scrlayer-scrpage.sty \
		  scrlayer-notecolumn.sty \
		  scrlayer-fancyhdr.sty

CLS_MAIN_DTX    = scrkernel-basics.dtx \
		  scrkernel-bibliography.dtx \
		  scrkernel-circularletters.dtx \
		  scrkernel-compatibility.dtx \
		  scrkernel-floats.dtx \
		  scrkernel-fonts.dtx \
		  scrkernel-footnotes.dtx \
		  scrkernel-index.dtx \
		  scrkernel-language.dtx \
		  scrkernel-letterclassoptions.dtx \
		  japanlco.dtx \
		  scrkernel-listsof.dtx \
		  scrkernel-listsandtabulars.dtx \
		  scrkernel-miscellaneous.dtx \
		  scrkernel-notepaper.dtx \
		  scrkernel-pagestyles.dtx \
		  scrkernel-paragraphs.dtx \
		  scrkernel-pseudolengths.dtx \
		  scrkernel-sections.dtx \
		  scrkernel-title.dtx \
		  scrkernel-tocstyle.dtx \
		  scrkernel-typearea.dtx \
		  scrkernel-variables.dtx \
		  scrkernel-version.dtx \
		  scrlfile.dtx \
		  scrwfile.dtx \
		  scraddr.dtx \
		  scrtime.dtx \
		  scrlogo.dtx \
	          scrextend.dtx \
                  scrhack.dtx \
		  scrjura.dtx \
		  tocbasic.dtx \
		  tocstyle.dtx \
		  scrlayer.dtx \
		  scrlayer-scrpage.dtx \
		  scrlayer-notecolumn.dtx \
		  scrlayer-fancyhdr.dtx

STATIC_DOC      = README \
	          INSTALL.txt \
		  INSTALLD.txt \
	          lppl.txt \
	          lppl-de.txt \
		  manifest.txt \
		  komabug.tex

CLS_MAIN_DVI	= scrsource.pdf

CLS_MAIN_INS	= scrmain.ins

CLS_MAIN_SUBINS	= scrstrip.inc scrstrop.inc scrdocstrip.tex

ALPHA_INS       = tocstyle.dtx scrlayer-fancyhdr.dtx

ALPHA_DOC       = tocstyle.pdf scrlayer-fancyhdr.pdf

ALPHA_DTX       = $(subst .pdf,.dtx,$(ALPHA_DOC))

CLS_MAIN_SRC	= $(CLS_MAIN_DTX) $(CLS_MAIN_INS) $(CLS_MAIN_SUBINS) \
		  scrsource.tex

$(ALPHA_DOC): $(ALPHA_DTX) scrdoc.cls $(CLS_MAIN)
	$(LATEX) $(BATCHMODE) $(PDFOUTPUT) $(subst .pdf,.dtx,$@)
	$(MKINDEX) $(subst .pdf,,$@)
	$(LATEX) $(BATCHMODE) $(PDFOUTPUT) $(subst .pdf,.dtx,$@)
	$(MKINDEX) $(subst .pdf,,$@)
	$(LATEX) $(BATCHMODE) $(PDFOUTPUT) $(subst .pdf,.dtx,$@)

$(CLS_MAIN): $(CLS_MAIN_DVI) $(CLS_MAIN_INS) $(MAKE_FILES)
	$(TEXUNPACK) $(CLS_MAIN_INS)
	$(foreach alphains,$(ALPHA_INS),$(TEXUNPACK) $(alphains);)

scrsource.pdf: scrsource.tex $(CLS_MAIN_DTX) $(MAKE_FILES) scrdoc.cls
	$(makepdffromdtx)

scrdoc.cls: scrdoc.dtx
	$(SSYMLINK) scrdoc.dtx scrdoc.cls

# ----------------------------------------------------------------------
CLS_FILES	= scrdoc.cls $(CLS_MAIN)

CLS_DVIS	= $(CLS_MAIN_DVI)

CLS_SRC		= $(CLS_MAIN_SRC)

NODIST_GENERATED = $(CLS_DVIS) $(CLS_FILES) $(ALPHA_DOC)

GENERATED	= $(NODIST_GENERATED) \
		  scrjura.ins \
		  scrwfile.ins \
		  tocbasic.ins \
	 	  tocstyle.ins tocstyle.tex tocstyle.drv

MISC_SRC	= $(MAKE_FILES) \
                  scrdoc.dtx

ifndef NOCHANGELOG
GENERATED      += ChangeLog
MISC_SRC       += ChangeLog ChangeLog.2
endif

DIST_SRC	= $(MISC_SRC) $(CLS_SRC)

DIST_FILES	= $(DIST_SRC) $(STATIC_DOC) $(ALPHA_DOC)

MAINTAIN_SRC    = $(DIST_SRC) missing.dtx .cvsignore

MAINTAIN_FILES  = $(MAINTAIN_SRC)
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# additional rules
tdsdist:dist
	# extract dist and make all
	$(UNTARGZ) $(DISTDIR).tar.gz
	chmod -R a+w $(DISTDIR)
ifdef PREPARERELEASE
	developer/scripts/preparerelease.sh 2 $(notdir $(DISTDIR))
endif
	$(CD) $(notdir $(DISTDIR)) && \
	  $(MAKE)
ifdef PREPARERELEASE
	$(MKDIR) $(notdir $(DISTDIR))/README.in
	$(INSTALL) README.in/README.*.sty README.in/README.*.cls $(notdir $(DISTDIR))/README.in
	developer/scripts/preparerelease.sh 3 $(notdir $(DISTDIR))
	$(RMDIR) $(notdir $(DISTDIR))/README.in
endif
	# install to temporary directory
	$(MKDIR) $(notdir $(DISTDIR))-bin/komascript-texmf
	$(CD) $(notdir $(DISTDIR)) && \
	  $(MAKE) INSTALLTEXMF=$(PWD)/$(notdir $(DISTDIR))-bin/komascript-texmf install
ifdef PREPARERELEASE
	developer/scripts/preparerelease.sh final $(notdir $(DISTDIR))
endif
	$(RMDIR) $(notdir $(DISTDIR))
	$(SRM) $(notdir $(DISTDIR))-bin/komascript-texmf/ls-R
	# build the tds.zip
	$(SRM) komascript.tds.zip
	$(CD) $(notdir $(DISTDIR))-bin/komascript-texmf && \
	  $(ZIP) ../../komascript.tds.zip source doc tex
	# clean up
	$(RMDIR) $(notdir $(DISTDIR))-bin
	$(SRM) $(notdir $(DISTDIR)).tar.gz

bindist:tdsdist
	# extract tds.zip
	$(MKDIR) $(notdir $(DISTDIR))-bin
	$(MKDIR) $(notdir $(DISTDIR))-bin/komascript-texmf
	$(CD) $(notdir $(DISTDIR))-bin/komascript-texmf && \
	  $(UNZIP) ../../komascript.tds.zip
	# copy some of the files to primary folder
	$(MV) komascript.tds.zip $(notdir $(DISTDIR))-bin/
ifndef NOCHANGELOG
	$(INSTALL) $(notdir $(DISTDIR))-bin/komascript-texmf/source/latex/koma-script/ChangeLog $(notdir $(DISTDIR))-bin
endif
	$(INSTALL) $(notdir $(DISTDIR))-bin/komascript-texmf/doc/latex/koma-script/scrgui* $(notdir $(DISTDIR))-bin
	$(INSTALL) $(notdir $(DISTDIR))-bin/komascript-texmf/doc/latex/koma-script/*.txt $(notdir $(DISTDIR))-bin
	$(INSTALL) $(notdir $(DISTDIR))-bin/komascript-texmf/doc/latex/koma-script/README $(notdir $(DISTDIR))-bin
	$(INSTALL) $(notdir $(DISTDIR))-bin/komascript-texmf/doc/latex/koma-script/koma*.html $(notdir $(DISTDIR))-bin
	$(GREP) 'CheckKOMAScriptVersion{' $(notdir $(DISTDIR))-bin/komascript-texmf/source/latex/koma-script/scrkernel-version.dtx | grep -o '2.*t' > $(notdir $(DISTDIR))-bin/VERSION
	# build the bin.zip
	$(RMDIR) $(notdir $(DISTDIR))-bin/komascript-texmf
	$(SRM) $(notdir $(DISTDIR))-bin.zip
	$(CD) $(notdir $(DISTDIR))-bin && \
	  $(ZIP) ../$(notdir $(DISTDIR))-bin.zip *
	# clean up
	$(RMDIR) $(notdir $(DISTDIR))-bin

ctandist:tdsdist
	# extract tds.zip
	$(SRMDIR) $(notdir $(DISTDIR))-ctan
	$(MKDIR) $(notdir $(DISTDIR))-ctan/texmf
	$(INSTALL) komascript.tds.zip $(notdir $(DISTDIR))-ctan
	$(CD) $(notdir $(DISTDIR))-ctan/texmf && \
	  $(UNZIP) ../komascript.tds.zip
	# copy some doc files to doc source
	$(INSTALL) $(notdir $(DISTDIR))-ctan/texmf/doc/latex/koma-script/*.html \
	  $(notdir $(DISTDIR))-ctan/texmf/doc/latex/koma-script/*.pdf \
	  $(notdir $(DISTDIR))-ctan/texmf/source/latex/koma-script/doc/
	# copy some doc files to main source
	$(INSTALL) $(notdir $(DISTDIR))-ctan/texmf/doc/latex/koma-script/*.txt \
	  $(notdir $(DISTDIR))-ctan/texmf/doc/latex/koma-script/*.tex \
	  $(notdir $(DISTDIR))-ctan/texmf/doc/latex/koma-script/README \
	  $(notdir $(DISTDIR))-ctan/texmf/source/latex/koma-script/
	# generate VERSION at main source
	$(GREP) 'CheckKOMAScriptVersion{' $(notdir $(DISTDIR))-ctan/texmf/source/latex/koma-script/scrkernel-version.dtx | grep -o '2.*t' \
	  > $(notdir $(DISTDIR))-ctan/texmf/source/latex/koma-script/VERSION
	# generate README.distributors at upmost
	$(HEAD) 18 $(notdir $(DISTDIR))-ctan/texmf/source/latex/koma-script/README > $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) 'File komascript.tds.zip is a complete TEXMF tree of KOMA-Script.  It may be' >> $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) 'used for manual installation or by distributors for distributions like' >> $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) '<http://mirror.ctan.org/tex-archive/install/macros/latex/contrib/komascript.tds.zip>.' >> $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) "File $(notdir $(DISTDIR)).ctan-src.zip is a file with sources and manuals of KOMA-Script"  >> $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) 'that CTAN seems to prefer for the distribution at'  >> $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) '<http://mirror.ctan.org/tex-archive/macros/latex/contrib/komascript>.' >> $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) 'Note, that it is not easy to generate a ready to use and complete installation' >> $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) "from $(notdir $(DISTDIR)).ctan-src.zip.  So it is hardly recommended to use" >> $(notdir $(DISTDIR))-ctan/README.distributors
	$(SECHO) 'komascript.tds.zip not only by users, but redistributors also.' >> $(notdir $(DISTDIR))-ctan/README.distributors
	# build ctan-src.zip
	$(CD) $(notdir $(DISTDIR))-ctan/texmf/source/latex && \
	  $(ZIP) ../../../$(notdir $(DISTDIR)).ctan-src.zip koma-script
	$(RMDIR) $(notdir $(DISTDIR))-ctan/texmf
	# build ctan.zip (with both ctan-src.zip and tds.zip)
	$(CD) $(notdir $(DISTDIR))-ctan && \
	  $(ZIP) ../$(notdir $(DISTDIR))-ctan.zip *
	# clean up
	$(RMDIR) $(notdir $(DISTDIR))-ctan

# ----------------------------------------------------------------------
# local rules

ChangeLog:
	$(warning Developers should generate ChangeLog manually, see developers/doc/README.)
	$(warning Distributors should not use a SVN version for their distributions!)
	$(warning Betatester may continue with an empty ChangeLog after using: touch ChangeLog)
	@exit 1

default_local: test_baseinit $(CLS_FILES)

prepare_local: # nothing to do

install_local: test_baseinit $(DIST_SRC) $(CLS_FILES) $(STATIC_DOC) $(ALPHA_DOC)
	@if ! $(MKDIR) $(INSTALLSRCDIR) \
	  || ! $(MKDIR) $(INSTALLCLSDIR) \
	  || ! $(MKDIR) $(INSTALLDOCDIR) ; then \
	    echo '--------------------------------------------------'; \
	    echo '| Cannot install to' $(INSTALLSRCDIR) or $(INSTALLCLSDIR) or $(INSTALLDOCDIR)!; \
	    echo '| You should try:'; \
	    echo '|     sudo "make install"'; \
	    echo '--------------------------------------------------'; \
	    exit 1; \
	fi
	$(INSTALL) $(DIST_SRC) $(INSTALLSRCDIR)
	$(INSTALL) $(CLS_FILES) $(INSTALLCLSDIR)
	$(INSTALL) $(STATIC_DOC) $(ALPHA_DOC) $(INSTALLDOCDIR)
	$(SECHO) ------------------------------------------------------------
	$(SECHO) Installed files at $(INSTALLSRCDIR):
	$(SECHO) $(DIST_SRC)
	$(SECHO) ------------------------------------------------------------
	$(SECHO) Installed files at $(INSTALLCLSDIR):
	$(SECHO) $(CLS_FILES)
	$(SECHO) ------------------------------------------------------------
	$(SECHO) Installed files at $(INSTALLDOCDIR):
	$(SECHO) $(STATIC_DOC) $(ALPHA_DOC)
	$(SECHO) ------------------------------------------------------------

uninstall_local:
	@if [ -d $(INSTALLSRCDIR) ]; then \
	    $(RM) -v $(foreach file,$(DIST_SRC),$(INSTALLSRCDIR)/$(file)); \
	    if [ ls $(INSTALLSRCDIR) > /dev/null 2>&1; then \
	        $(RMDIR) -v $(INSTALLSRCDIR); \
	    else \
	        echo "$(INSTALLSRCDIR) not empty!"; \
	    fi; \
	else \
	    echo "$(INSTALLSRCDIR) not found --> nothing to uninstall!"; \
	fi
	@if [ -d $(INSTALLCLSDIR) ]; then \
	    $(RM) -v $(foreach file,$(CLS_FILES),$(INSTALLCLSDIR)/$(file)); \
	    if ls $(INSTALLCLSDIR) > /dev/null 2>&1; then \
	        $(RMDIR) -v $(INSTALLCLSDIR); \
	    else \
	        echo "$(INSTALLCLSDIR) not empty!"; \
	    fi; \
	else \
	    echo "$(INSTALLCLSDIR) not found --> nothing to uninstall!"; \
	fi
	@if [ -d $(INSTALLDOCDIR) ]; then \
	    $(RM) -v $(foreach file,$(STATIC_DOC),$(INSTALLDOCDIR)/$(file)); \
	    if ls $(INSTALLDOCDIR) > /dev/null 2>&1; then \
	        $(RMDIR) -v $(INSTALLDOCDIR); \
	    else \
	        echo "$(INSTALLDOCDIR) not empty!"; \
	    fi; \
	else \
	    echo "$(INSTALLDOCDIR) not found --> nothing to uninstall!"; \
	fi

clean_local:
	$(SRM) *~ $(CLEANEXTS)

distclean_local: clean_local
	$(SRM) $(NODIST_GENERATED)

maintainclean_local: clean_local
	$(SRM) $(GENERATED)

dist_prior:
ifdef PREPARERELEASE
ifndef NOCHANGELOG
	developer/scripts/preparerelease.sh 1
endif
	$(MAKE) prepare
endif
	-$(RMDIR) $(DISTDIR)
	$(MKDIR) $(DISTDIR)

dist_local: $(DIST_FILES) $(NODIST_GENERATED)
	$(CP) $(DIST_FILES) $(DISTDIR)

dist_post:
	$(TARGZ) $(DISTDIR).tar.gz $(notdir $(DISTDIR))
	$(RMDIR) $(DISTDIR)
	$(LL) $(notdir $(DISTDIR)).tar.gz

dist-bz2_post:
	$(STARBZ) $(DISTDIR).tar.bz2 $(notdir $(DISTDIR))
	$(SRMDIR) $(DISTDIR)
	$(SLL) $(notdir $(DISTDIR)).tar.bz2

dist-zip_post:
	$(SZIP) $(DISTDIR).zip $(notdir $(DISTDIR))
	$(SRMDIR) $(DISTDIR)
	$(SLL) $(notdir $(DISTDIR)).zip

maintain_prior:
	-$(RMDIR) $(MAINTAINDIR)
	$(MKDIR) $(MAINTAINDIR)

maintain_local:
	$(CP) $(MAINTAIN_FILES) $(MAINTAINDIR)

maintain_post:
	$(TARGZ) $(MAINTAINDIR).tar.gz $(notdir $(MAINTAINDIR))
	$(RMDIR) $(MAINTAINDIR)
	$(LL) $(notdir $(MAINTAINDIR)).tar.gz

maintain-bz2_post:
	$(STARBZ) $(MAINTAINDIR).tar.bz2 $(notdir $(MAINTAINDIR))
	$(SRMDIR) $(MAINTAINDIR)
	$(SLL) $(notdir $(MAINTAINDIR)).tar.bz2

maintain-zip_post:
	$(SZIP) $(MAINTAINDIR).zip $(notdir $(MAINTAINDIR))
	$(SRMDIR) $(MAINTAINDIR)
	$(SLL) $(notdir $(MAINTAINDIR)).zip
# ----------------------------------------------------------------------
