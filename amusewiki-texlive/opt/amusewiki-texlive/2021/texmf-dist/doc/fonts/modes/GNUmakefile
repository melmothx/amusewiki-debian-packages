# $Id: GNUmakefile,v 1.6 2020/09/08 22:13:43 karl Exp $
# Makefile for the mode_def collection. Public domain.

version = 4.2

default: check

testfonts = cmr5 cmtt8 cmti7 cmr10 cmti10 cmtt10 cmtt12 cmr17
%.600pk: %.600gf
	gftopk $<

%.tfm %.600gf: modes.base
	mf '&./modes \mode:=ljfour; nonstopmode; input $*'

test.ps: $(addsuffix .600pk,$(testfonts)) test.dvi
	dvips test -o 

test.dvi: $(addsuffix .tfm, $(testfonts)) test.tex
	tex test

# Upload in directory modes/ per CTAN. 
distdir = modes
distname = $(distdir)/modes.mf
dist: badnames
	test -z `rcslocks`
	rm -rf $(distdir) && mkdir $(distdir)
	expand <modes.mf | sed 's/[ 	]*$$//' >$(distname)
# ensure no trailing spaces crept into the source (sigh):
	diff modes.mf $(distname)
# these three commands are tiny shell scripts, not distributed (better to
# start with the versioned file).
	add-version $(version) $(distname)
	add-date $(distname)
	fix-checksum $(distname)
#
	cp -p ChangeLog GNUmakefile README $(distdir)/
	cp -p modedpicheck $(distdir)/
	cp -p list $(distdir)/modelist.txt
	cp -p shortlist $(distdir)/modenames.txt
	cd $(distdir) && mft ./modes.mf && pdftex ./modes.tex && rm -f *.log modes.tex
	rm -f modes.zip; zip -r modes.zip modes

# old stuff for karl.
#	mv $$HOME/mail/2modes $(archive)/$(version).mail && gzip $(archive)/$(version).mail
#	cp -p $(distname) $(archive) && gzip -f $(archive)/$(distname) && rooo
#	cp -p $(distname) $(mfsys)/modes.mf
#archive = $(HOME)/misc/archive/modes

list: modes.mf
	grep \^mode_def modes.mf | grep -v help | sed 's/\\\[//' >list

shortlist: list
	sed 's/^mode_def \(.*\) =.*$$/\1/' list >$@

badnames: shortlist
	sort $< | uniq -d
#
# don't check this any more; we don't need to limit to eight chars,
# and hitexlaptop and hitexmobile are longer.
#	gawk '{if (length ($$0) > 8) {print $0; count++} } END {exit count}' $<

dvi: modes.dvi
modes.dvi: modes.tex
	tex '\scrollmode \input modes.tex'

pdf: modes.pdf
modes.pdf: modes.tex
	texfot pdftex '\nonstopmode \input modes.tex'

modes.tex: modes.mf
	mft modes.mf

modes.base: modes.mf
	mf -ini plain input modes\; dump
	mv plain.base $@

# systematically check all modes, and some known past problems.
check: badnames modes.dvi checkx check-primitives check-modedpi \
cmr10.300pk logo10.2540gf test.ps cmbsy7.1200gf

# Check that Xerox info is included if requested. Must use -ini because
# mf.base includes modes.mf by default, and it intentionally stops
# itself from being read twice. So, for development convenience, do it
# all by hand (instead of depending on modes.base and dumping it anew
# every time). The conditional here is exactly what mktextfm does.
# 
checkx cx:
	rm -f plain.tfm
	-mf -ini '\input plain; nonstopmode; input modes; mode:=cx; if known mode_include_extra_info_available: mode_include_extra_info fi; input logo10'
	tftopl ./plain.tfm | fgrep CODING

check-mktextfm:
	rm -f logo10.tfm
	mktextfm --destdir=`pwd` logo10
# no xerox info by default:
	! (tftopl ./logo10.tfm | fgrep CODING)
#
	rm -f logo10.tfm
	env MF_MODE_EXTRA_INFO=1 mktextfm --destdir=`pwd` logo10
# xerox info if requested:
	tftopl ./logo10.tfm | fgrep CODING
# This will fail unless the new mktextfm is in PATH, and
# unless the correct modes.mf is compiled into mf.base,.
# It seems like overkill to have a new option to mktextfm so we can
# specify a fake mf, something like "inimf \input plain \input modes ...".
# We'll just test after installation.

check-primitives: modes.base
# test for knuth: primitives work as designed, no Xerox info by default.
	mf "&./modes \fontmaking:=1; end"
	! (tftopl ./mfput.tfm | fgrep CODING)

check-modedpi:
	modedpicheck

gft: cmr10.600gf
	gftype -m -i ./$< >cmr10.600gft
cmr10.600gf: modes.base
	mf '&./modes \mode:=ricoh; mag:=2; input cmr10'

# Make sure write-white works.
cmr10.300pk: modes.base
	mf "&./modes \mode:=ricoh; scrollmode; input cmr10"

# cmbsy7 fails with blacker >= 3 and pixels_per_inch >= 1200.
cmbsy7.1200gf: modes.base
	mf "&./modes \mode:=lexmarkr; scrollmode; input cmbsy7"

logo10.2540gf: shortlist modes.base
	for f in `cat shortlist`; do echo $${f};			\
          mf "&./modes \mode:=$${f}; scrollmode; input logo10";	\
	done

realclean distclean clean mostlyclean:
	rm -f *gf *.gft *pk *.tfm *.pl *.ps *.log *.base *.dvi
	rm -f modes.dvi list shortlist modes.tex modes.pdf
