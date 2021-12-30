UPTEX = uptex
PTEX = ptex
UPLATEX = uplatex
PLATEX = platex
UPBIBTEX = upbibtex
PBIBTEX = pbibtex
DVIPS = dvips
DVIPDFMX = dvipdfmx
UPDVITYPE = updvitype
PDVITYPE = pdvitype
UPMPOST = upmpost
PMPOST = pmpost
DVI2TTYJ = dvi2tty -J
DVI2TTYA = dvi2tty -A
DVI2TTYU = dvi2tty -U
EUPLATEX = uplatex
EPLATEX = platex
CONVBKMK = convbkmk -g
CONVBKMKO = convbkmk -g -o
PS2PDF = ps2pdf

all: uplatex-euc.fmt uplatex-sjis.fmt \
 misc kin widow uptex uplatex aozora adobe \
 babel greek punct encswitch \
 jscman tfpl otf jbib jisuni dvi2tty bkmk consio eplatex texxet

####
#### "platex on uptex"
####   These are for test purpose.
####     uplatex-euc  : platex (kanji-internal=euc)  on e-uptex
####     uplatex-sjis : platex (kanji-internal=sjis) on e-uptex
UPLATEX_EUC  = euptex -progname=uplatex-euc
UPLATEX_SJIS = euptex -progname=uplatex-sjis

uplatex-euc.fmt:
	euptex -ini -etex -jobname=uplatex-euc -progname=uplatex-euc -kanji=utf8 --kanji-internal=euc platex.ini

uplatex-sjis.fmt:
	euptex -ini -etex -jobname=uplatex-sjis -progname=uplatex-sjis -kanji=utf8 --kanji-internal=sjis platex.ini

####
####

misc: misch miscv

misch:
	for f in misc set3; do \
		$(UPLATEX) $$f-check-h-utf8 ; \
		$(UPLATEX) "\def\withhyperref{dvipdfmx}\input" $$f-check-h-utf8.tex ; \
		$(UPLATEX) "\def\withhyperref{dvipdfmx}\input" $$f-check-h-utf8.tex ; \
		$(UPDVITYPE) $$f-check-h-utf8.dvi > $$f-check-h-utf8.pdvitype ; \
		perl check_enc.pl utf8 $$f-check-h-utf8.log $$f-check-h-utf8.aux $$f-check-h-utf8.out $$f-check-h-utf8.pdvitype ; \
		$(DVIPDFMX) $$f-check-h-utf8 ; \
		$(UPLATEX) "\def\withhyperref{dvips}\input" $$f-check-h-utf8.tex ; \
		$(DVIPS) $$f-check-h-utf8 ; \
		$(CONVBKMK) $$f-check-h-utf8.ps ; \
		$(PS2PDF) $$f-check-h-utf8-convbkmk.ps ; \
	done

miscv:
	for f in misc ; do \
		$(UPLATEX) $$f-check-v-utf8 ; \
		$(UPLATEX) "\def\withhyperref{dvipdfmx}\input" $$f-check-v-utf8.tex ; \
		$(UPLATEX) "\def\withhyperref{dvipdfmx}\input" $$f-check-v-utf8.tex ; \
		$(UPDVITYPE) $$f-check-v-utf8.dvi > $$f-check-v-utf8.pdvitype ; \
		perl check_enc.pl utf8 $$f-check-v-utf8.log $$f-check-v-utf8.aux $$f-check-v-utf8.out $$f-check-v-utf8.pdvitype ; \
		$(DVIPDFMX) $$f-check-v-utf8 ; \
		$(UPLATEX) "\def\withhyperref{dvips}\input" $$f-check-v-utf8.tex ; \
		$(DVIPS) $$f-check-v-utf8 ; \
		$(CONVBKMK) $$f-check-v-utf8.ps ; \
		$(PS2PDF) $$f-check-v-utf8-convbkmk.ps ; \
	done

kin:
	$(UPLATEX) kinsoku-chk-utf8
	$(DVIPDFMX) kinsoku-chk-utf8
	$(DVIPS) kinsoku-chk-utf8

widow:
	$(PLATEX) widow
	mv widow.dvi widow-platex.dvi
	$(DVIPDFMX) widow-platex.dvi
	$(UPLATEX_EUC) widow
	mv widow.dvi widow-u-euc.dvi
	$(DVIPDFMX) widow-u-euc.dvi
	$(UPLATEX) widow
	mv widow.dvi widow-u-uptex.dvi
	$(DVIPDFMX) widow-u-uptex.dvi

uptex:
	$(UPTEX) sangoku-uptex
	$(DVIPDFMX) sangoku-uptex
	$(DVIPS) sangoku-uptex

uplatex:
	$(UPLATEX) sangoku-uplatex
	$(DVIPDFMX) sangoku-uplatex
	$(DVIPS) sangoku-uplatex

aozora:
	for cls in ujarticle ujreport ujbook utarticle utreport utbook; do \
		$(UPLATEX) aozora-$$cls-utf8 ; \
		$(DVIPDFMX) aozora-$$cls-utf8 ; \
		$(DVIPS) aozora-$$cls-utf8 ; \
	done

adobe: adobeu adobec

adobeu:
	for cjk in jp kr gb cns; do \
		$(UPTEX) adobe-$$cjk-utf8 ; \
		$(DVIPDFMX) adobe-$$cjk-utf8 ; \
		$(DVIPS) adobe-$$cjk-utf8 ; \
	done

# It requires japanese-otf package.
adobec:
	for cjk in jp kr gb cns; do \
		$(UPLATEX) "\def\adobe{$$cjk}\input" adobe-cid ; \
		mv adobe-cid.dvi adobe-$$cjk-mc-cid.dvi ; \
		$(DVIPDFMX) adobe-$$cjk-mc-cid ; \
		$(DVIPS) adobe-$$cjk-mc-cid ; \
	done
	for cjk in jp kr cns; do \
		$(UPLATEX) "\def\adobe{$$cjk}\def\family{gt}\input" adobe-cid ; \
		mv adobe-cid.dvi adobe-$$cjk-gt-cid.dvi ; \
		$(DVIPDFMX) adobe-$$cjk-gt-cid ; \
		$(DVIPS) adobe-$$cjk-gt-cid ; \
	done

babel:
	$(UPLATEX) cjk_babel
	$(DVIPDFMX) cjk_babel
	$(DVIPS) cjk_babel
	$(DVI2TTYU) -Eu cjk_babel > cjk_babel.dvi2tty

# It requires unicode package (utf.sty etc.).
greek:
	$(UPLATEX) greek-uplatex
	$(DVIPDFMX) greek-uplatex
	$(DVIPS) greek-uplatex

punct:
	$(UPLATEX) punctuation
	$(DVIPDFMX) punctuation
	$(DVIPS) punctuation

encswitch: encswitchj encswitchp encswitchu

### "platex on uptex" for test
encswitchj:
	for ie in euc sjis; do \
		euptex -kanji=$$ie --kanji-internal=$$ie -fmt=uplatex-$$ie simple-jis.tex ; \
		perl check_enc.pl $$ie simple-jis.log simple-jis.aux || exit ; \
		mv simple-jis.dvi simple-jis0-$$ie.dvi ; \
		mv simple-jis.log simple-jis0-$$ie.log ; \
		mv simple-jis.aux simple-jis0-$$ie.aux ; \
		$(DVIPDFMX) simple-jis0-$$ie.dvi ; \
	for fe in jis euc sjis utf8; do \
		euptex -kanji=$$fe --kanji-internal=$$ie -fmt=uplatex-$$ie simple-$$fe.tex ; \
		perl check_enc.pl $$fe simple-$$fe.log simple-$$fe.aux || exit ; \
		mv simple-$$fe.dvi simple-$$fe-$$ie.dvi ; \
		mv simple-$$fe.log simple-$$fe-$$ie.log ; \
		mv simple-$$fe.aux simple-$$fe-$$ie.aux ; \
		$(DVIPDFMX) simple-$$fe-$$ie.dvi ; \
		$(UPDVITYPE) -kanji=$$fe simple-$$fe-$$ie.dvi > simple-$$fe-$$ie.pdvitype ; \
		perl check_enc.pl $$fe simple-$$fe-$$ie.pdvitype || exit ; \
	done ; \
	done

### platex
encswitchp:
	for fe in jis euc sjis utf8; do \
		$(PLATEX) -kanji=$$fe simple-$$fe.tex ; \
		perl check_enc.pl $$fe simple-$$fe.log simple-$$fe.aux || exit ; \
		mv simple-$$fe.dvi simple-$$fe-platex.dvi ; \
		mv simple-$$fe.log simple-$$fe-platex.log ; \
		mv simple-$$fe.aux simple-$$fe-platex.aux ; \
		$(DVIPDFMX) simple-$$fe-platex.dvi ; \
		$(PDVITYPE) -kanji=$$fe simple-$$fe-platex.dvi > simple-$$fe-platex.pdvitype ; \
		perl check_enc.pl $$fe simple-$$fe-platex.pdvitype || exit ; \
	done

### uplatex
encswitchu:
	for ie in uptex; do \
	for fe in jis utf8; do \
		$(UPLATEX) -kanji=utf8 simple-u-$$fe.tex ; \
		perl check_enc.pl $$ie simple-u-$$fe.log simple-u-$$fe.aux || exit ; \
		mv simple-u-$$fe.dvi simple-u-$$fe-$$ie.dvi ; \
		mv simple-u-$$fe.log simple-u-$$fe-$$ie.log ; \
		mv simple-u-$$fe.aux simple-u-$$fe-$$ie.aux ; \
		$(DVIPDFMX) simple-u-$$fe-$$ie.dvi ; \
		$(UPDVITYPE) simple-u-$$fe-$$ie.dvi > simple-u-$$fe-$$ie.pdvitype ; \
		perl check_enc.pl utf8 simple-u-$$fe-$$ie.pdvitype || exit ; \
	done ; \
	done

dvi2tty: dvi2ttyp dvi2ttyu

dvi2ttyp: encswitchp
	for fe in j e s u; do \
		$(DVI2TTYJ) -w 62 -o simple-jis-platex-$$fe-j.dvi2tty -E $$fe simple-jis-platex.dvi ; \
		perl check_enc.pl $$fe simple-jis-platex-$$fe-j.dvi2tty || exit ; \
		$(DVI2TTYA) -w 62 -o simple-jis-platex-$$fe-a.dvi2tty -E $$fe simple-jis-platex.dvi ; \
		perl check_enc.pl $$fe simple-jis-platex-$$fe-a.dvi2tty || exit ; \
		diff simple-jis-platex-$$fe-j.dvi2tty simple-jis-platex-$$fe-a.dvi2tty || exit ; \
	done

dvi2ttyu: encswitchu
	for fe in j e s u; do \
		$(DVI2TTYJ) -w 62 -o simple-u-jis-uptex-$$fe-j.dvi2tty -E $$fe simple-u-jis-uptex.dvi ; \
		perl check_enc.pl $$fe simple-u-jis-uptex-$$fe-j.dvi2tty || exit ; \
		$(DVI2TTYU) -w 62 -o simple-u-jis-uptex-$$fe-u.dvi2tty -E $$fe simple-u-jis-uptex.dvi ; \
		perl check_enc.pl $$fe simple-u-jis-uptex-$$fe-u.dvi2tty || exit ; \
		diff simple-u-jis-uptex-$$fe-j.dvi2tty simple-u-jis-uptex-$$fe-u.dvi2tty || exit ; \
	done
	for fe in u; do \
		$(DVI2TTYJ) -w 62 -o simple-u-utf8-uptex-$$fe-j.dvi2tty -E $$fe simple-u-utf8-uptex.dvi ; \
		perl check_enc.pl $$fe simple-u-utf8-uptex-$$fe-j.dvi2tty || exit ; \
		$(DVI2TTYU) -w 62 -o simple-u-utf8-uptex-$$fe-u.dvi2tty -E $$fe simple-u-utf8-uptex.dvi ; \
		perl check_enc.pl $$fe simple-u-utf8-uptex-$$fe-u.dvi2tty || exit ; \
		diff simple-u-utf8-uptex-$$fe-j.dvi2tty simple-u-utf8-uptex-$$fe-u.dvi2tty || exit ; \
	done

jbib: jbibp jbibu

### platex & upbibtex
jbibp:
	for be in euc uptex; do \
	for fe in jis euc sjis utf8; do \
		rm -f jbib1-jis.aux jbib1-jis.bbl ; \
		$(PLATEX) -kanji=$$fe jbib1-jis.tex ; \
		$(UPBIBTEX) -kanji=$$fe --kanji-internal=$$be jbib1-jis ; \
		$(PLATEX) -kanji=$$fe jbib1-jis.tex ; \
		$(PLATEX) -kanji=$$fe jbib1-jis.tex ; \
		perl check_enc.pl $$fe jbib1-jis.aux jbib1-jis.bbl || exit ; \
		mv jbib1-jis.dvi jbib1-$$fe-$$be.dvi ; \
		mv jbib1-jis.log jbib1-$$fe-$$be.log ; \
		mv jbib1-jis.aux jbib1-$$fe-$$be.aux ; \
		mv jbib1-jis.bbl jbib1-$$fe-$$be.bbl ; \
		mv jbib1-jis.blg jbib1-$$fe-$$be.blg ; \
		$(DVIPDFMX) jbib1-$$fe-$$be.dvi ; \
	done ; \
	done

### uplatex & upbibtex
jbibu:
	for be in uptex; do \
	for fe in utf8; do \
	for no in 2 3; do \
		rm -f jbib$$no-utf8.aux jbib$$no-utf8.bbl ; \
		$(UPLATEX) -kanji=$$fe jbib$$no-utf8.tex ; \
		$(UPBIBTEX) -kanji=$$fe --kanji-internal=$$be jbib$$no-utf8 ; \
		$(UPLATEX) -kanji=$$fe jbib$$no-utf8.tex ; \
		$(UPLATEX) -kanji=$$fe jbib$$no-utf8.tex ; \
		perl check_enc.pl $$fe jbib$$no-utf8.aux jbib$$no-utf8.bbl || exit ; \
		mv jbib$$no-utf8.dvi jbib$$no-$$fe-$$be.dvi ; \
		mv jbib$$no-utf8.log jbib$$no-$$fe-$$be.log ; \
		mv jbib$$no-utf8.aux jbib$$no-$$fe-$$be.aux ; \
		mv jbib$$no-utf8.bbl jbib$$no-$$fe-$$be.bbl ; \
		mv jbib$$no-utf8.blg jbib$$no-$$fe-$$be.blg ; \
		$(DVIPDFMX) jbib$$no-$$fe-$$be.dvi ; \
	done ; \
	done ; \
	done

pmpost: pmpostj pmpostu

pmpostj:
	for fe in jis euc sjis utf8; do \
	for fn in area jstr; do \
		$(UPMPOST) -kanji=$$fe -tex="uplatex -kanji=$$fe" $$fn-$$fe.mp ; \
		$(UPLATEX) -kanji=$$fe $$fn-$$fe-incl.tex ; \
		$(DVIPS) $$fn-$$fe-incl.dvi ; \
		$(DVIPDFMX) $$fn-$$fe-incl.dvi ; \
	done ; \
		perl check_enc.pl $$fe area-$$fe.mpx || exit ; \
	done

pmpostu:
	for fe in uptex; do \
	for fn in area jstr; do \
		$(UPMPOST) -kanji=$$fe -tex=uplatex $$fn-$$fe.mp ; \
		$(UPLATEX) $$fn-$$fe-incl.tex ; \
		$(DVIPS) $$fn-$$fe-incl.dvi ; \
		$(DVIPDFMX) $$fn-$$fe-incl.dvi ; \
	done ; \
		perl check_enc.pl $$fe area-$$fe.mpx || exit ; \
	done

# It requires jsclasses.
jsclasses: jscman jscfonts

jsclasses-uplatex.dtx:
	cat `kpsewhich jsclasses.dtx` | \
	sed -e "s/documentclass{jsarticle}/documentclass[uplatex]{jsarticle}/" -e "s/jsclasses.dtx/jsclasses-uplatex.dtx/" > jsclasses-uplatex.dtx

jscman: jsclasses-uplatex.dtx
	$(UPLATEX) jsclasses-uplatex.dtx
	$(DVIPDFMX) jsclasses-uplatex
	$(DVIPS) jsclasses-uplatex

jscfonts:
	for fn in mingoth jis default; do \
		$(UPLATEX) "\def\option{$$fn}\input" yaku-jsc-utf8 ; \
		mv yaku-jsc-utf8.dvi yaku-jsc-$$fn-utf8.dvi ; \
		$(DVIPDFMX) yaku-jsc-$$fn-utf8.dvi ; \
	done
	for fn in mingoth jis default; do \
		$(PLATEX) "\def\option{$$fn}\input" yaku-jsc-jis ; \
		mv yaku-jsc-jis.dvi yaku-jsc-$$fn-jis.dvi ; \
		$(DVIPDFMX) yaku-jsc-$$fn-jis.dvi ; \
	done

# It requires japanese-otf package.
jisuni:
	$(UPLATEX) jis_uni_variation
	$(DVIPDFMX) jis_uni_variation

tfpl: tfplj tfplu

tfplj:
	ptftopl -charcode-format=octal min10x.tfm min10x-oct.pl
	for fe in jis euc sjis utf8; do \
		ptftopl -kanji=$$fe \
			min10x.tfm min10x-$$fe.pl ; \
		perl check_enc.pl $$fe min10x-$$fe.pl || exit ; \
		ppltotf -kanji=$$fe \
			min10x-$$fe.pl min10x-$$fe.tfm ; \
		diff min10x.tfm min10x-$$fe.tfm || exit ; \
	for ie in jis oct; do \
		ppltotf -kanji=$$fe \
			min10x-$$ie.pl min10x-$$ie-$$fe.tfm ; \
		diff min10x.tfm min10x-$$ie-$$fe.tfm || exit ; \
	done ; \
	done

tfplu:
	uptftopl -charcode-format=octal umin10x.tfm umin10x-oct.pl
	uptftopl umin10x.tfm umin10x-utf8.pl
	perl check_enc.pl utf8 umin10x-utf8.pl
	nkf -j umin10x-utf8.pl > umin10x-jis.pl
	for fe in uptex; do \
	for ie in jis oct utf8; do \
		uppltotf -kanji=$$fe \
			umin10x-$$ie.pl umin10x-$$ie-$$fe.tfm ; \
		diff umin10x.tfm umin10x-$$ie-$$fe.tfm || exit ; \
	done ; \
	done

utfotf: utf otf

# It requires utf package by psitau-san.
utf: utf_sample

utf_sample: 
	$(UPLATEX) utfsmpl-uplatex
	$(DVIPDFMX) utfsmpl-uplatex
	$(DVIPS) utfsmpl-uplatex

# It requires japanese-otf package by psitau-san.
otf: otf_sample

otf_sample:
	$(UPLATEX) otfsmpl-uplatex
	$(DVIPDFMX) otfsmpl-uplatex
	$(DVIPS) otfsmpl-uplatex

# It requires ruby.
bkmk: bkmk_jis bkmk_utf8
bkmk_jis: bkmk_jis_dvipdfmx bkmk_jis_dvips
bkmk_utf8: bkmk_utf8_dvipdfmx bkmk_utf8_dvips

bkmk_jis_dvipdfmx: bkmk_docinfo
	for en in jis ; do \
	for up in platex uplatex; do \
		rm -f bkmk-$$en.aux bkmk-$$en.out ; \
		$$up bkmk-$$en.tex ; \
		$$up "\def\withhyperref{dvipdfmx}\input" bkmk-$$en.tex ; \
		$$up "\def\withhyperref{dvipdfmx}\input" bkmk-$$en.tex ; \
		mv bkmk-$$en.dvi bkmk-$$en-pd-$$up.dvi ; \
		$(DVIPDFMX) bkmk-$$en-pd-$$up.dvi ; \
		$$up "\def\withhyperref{dvipdfmx}\def\nocmap{true}\input" bkmk-$$en.tex ; \
		$$up "\def\withhyperref{dvipdfmx}\def\nocmap{true}\input" bkmk-$$en.tex ; \
		$(CONVBKMKO) bkmk-$$en.out ; \
		$$up "\def\withhyperref{dvipdfmx}\def\nocmap{true}\input" bkmk-$$en.tex ; \
		mv bkmk-$$en.dvi bkmk-$$en-pd2-$$up.dvi ; \
		$(DVIPDFMX) bkmk-$$en-pd2-$$up.dvi ; \
	done \
	done

bkmk_jis_dvips: bkmk_docinfo
	for en in jis ; do \
	for up in platex uplatex; do \
		rm -f bkmk-$$en.aux bkmk-$$en.out ; \
		$$up "\def\withhyperref{dvips}\input" bkmk-$$en.tex ; \
		$$up "\def\withhyperref{dvips}\input" bkmk-$$en.tex ; \
		mv bkmk-$$en.dvi bkmk-$$en-ps-$$up.dvi ; \
		$(DVIPS) bkmk-$$en-ps-$$up.dvi ; \
		$(CONVBKMK) bkmk-$$en-ps-$$up.ps ; \
		$(PS2PDF) bkmk-$$en-ps-$$up-convbkmk.ps ; \
	done \
	done

bkmk_utf8_dvipdfmx: bkmk_docinfo
	for en in utf8; do \
	for up in platex uplatex; do \
		rm -f bkmk-$$en.aux bkmk-$$en.out ; \
		$$up "\def\withhyperref{dvipdfmx}\input" bkmk-$$en.tex ; \
		$$up "\def\withhyperref{dvipdfmx}\input" bkmk-$$en.tex ; \
		mv bkmk-$$en.dvi bkmk-$$en-pd-$$up.dvi ; \
		$(DVIPDFMX) bkmk-$$en-pd-$$up.dvi ; \
		$$up "\def\withhyperref{dvipdfmx}\def\nocmap{true}\input" bkmk-$$en.tex ; \
		$$up "\def\withhyperref{dvipdfmx}\def\nocmap{true}\input" bkmk-$$en.tex ; \
		$(CONVBKMKO) bkmk-$$en.out ; \
		$$up "\def\withhyperref{dvipdfmx}\def\nocmap{true}\input" bkmk-$$en.tex ; \
		mv bkmk-$$en.dvi bkmk-$$en-pd2-$$up.dvi ; \
		$(DVIPDFMX) bkmk-$$en-pd2-$$up.dvi ; \
	done \
	done

bkmk_utf8_dvips: bkmk_docinfo
	for en in utf8; do \
	for up in platex uplatex; do \
		rm -f bkmk-$$en.aux bkmk-$$en.out ; \
		$$up "\def\withhyperref{dvips}\input" bkmk-$$en.tex ; \
		$$up "\def\withhyperref{dvips}\input" bkmk-$$en.tex ; \
		mv bkmk-$$en.dvi bkmk-$$en-ps-$$up.dvi ; \
		$(DVIPS) bkmk-$$en-ps-$$up.dvi ; \
		$(CONVBKMK) bkmk-$$en-ps-$$up.ps ; \
		$(PS2PDF) bkmk-$$en-ps-$$up-convbkmk.ps ; \
	done \
	done

bkmk_docinfo: bkmk-docinfo.txt
	cp bkmk-docinfo.txt bkmk-docinfo.out
	$(CONVBKMKO) bkmk-docinfo.out

consio: consio_ptex consio_uptex
consio_ptex:
	$(PTEX) -kanji=euc "\def\cjk{jis}\input" console_io.tex < iotext.txt > console_io-ptex.out
	$(PTEX) -kanji=euc "\def\cjk{jis}\input" console_io.tex < iotext.txt
	mv console_io.dvi console_io-ptex.dvi
	$(DVIPDFMX) console_io-ptex.dvi

consio_uptex:
	$(UPTEX) -kanji=uptex "\def\cjk{jpn}\input" console_io.tex < iotext.txt > console_io-uptex.out
	$(UPTEX) -kanji=uptex "\def\cjk{jpn}\input" console_io.tex < iotext.txt
	mv console_io.dvi console_io-uptex.dvi
	$(DVIPDFMX) console_io-uptex.dvi

# It requires e-upLaTeX, e-pLaTeX.
eplatex: texxet eptexdoc
texxet: texxet_euplatex texxet_eplatex

texxet_euplatex:
	$(EUPLATEX) texxet-jis.tex ; \
	mv texxet-jis.dvi texxet-jis-euplatex.dvi ; \
	$(DVIPDFMX) texxet-jis-euplatex.dvi ; \
	$(DVI2TTYU) -w 62 -o texxet-jis-euplatex.dvi2tty -E u texxet-jis-euplatex.dvi

texxet_eplatex:
	$(EPLATEX) texxet-jis.tex ; \
	mv texxet-jis.dvi texxet-jis-eplatex.dvi ; \
	$(DVIPDFMX) texxet-jis-eplatex.dvi ; \
	$(DVI2TTYA) -w 62 -o texxet-jis-eplatex.dvi2tty -E u texxet-jis-eplatex.dvi

# Following files are in ptex-base
eptexdoc-uplatex.tex:
	cat `kpsewhich -format=doc eptexdoc.tex` | \
	sed -e "s/]{jsarticle}/,uplatex]{jsarticle}/" > eptexdoc-uplatex.tex
	cp -p `kpsewhich -format=doc fam256p.tex` .
	cp -p `kpsewhich -format=doc fam256d.tex` .

eptexdoc: eptexdoc-uplatex.tex
	$(EUPLATEX) -kanji=utf8 eptexdoc-uplatex.tex ; \
	$(EUPLATEX) -kanji=utf8 eptexdoc-uplatex.tex ; \
	$(DVIPDFMX) eptexdoc-uplatex.dvi


clean:
	rm -f *.fmt *.aux *.log *.dvi *.ps *.pdf *.mpx *.1 \
		min10x-* umin10x-* *.out *.blg *.bbl *.pdvitype *.dvi2tty \
		jsclasses-uplatex.dtx eptexdoc-uplatex.tex fam256*.tex
