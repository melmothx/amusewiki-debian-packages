MAKEJVF =  makejvf
TFTOPL  = uptftopl -kanji=utf8
PLTOTF  = uppltotf -kanji=uptex
MAKEJVFJ3 = $(MAKEJVF) -i -u jis -3
MAKEJVFG3 = $(MAKEJVF) -i -u gb -3
MAKEJVFC3 = $(MAKEJVF) -i -u cns -3
MAKEJVFK  = $(MAKEJVF) -i -u ks
MAKEJVFJ  = $(MAKEJVF) -i -u jis
MAKEJVFJQ = $(MAKEJVF) -i -u jisq
MAKEJVFX  = $(MAKEJVF) -i -u custom

all: tfm vf pstfm

pl:
	$(TFTOPL) `kpsewhich jis.tfm` jis.pl
	perl -s -n -C makepl.perl jis.pl > upjisr-h.pl
	perl -s -n -C makepl.perl -hk jis.pl > upjisr-h-hk.pl
	$(TFTOPL) `kpsewhich jis-v.tfm` jis-v.pl
	perl -s -n -C makepl.perl jis-v.pl > upjisr-v.pl
	rm -f jis.pl jis-v.pl

tfm:
	for fnt in upjisr upjisg upjpnrm upjpngt ; do \
		$(PLTOTF) upjisr-h-hk.pl $$fnt-h.tfm ; \
	done
	for fnt in upjisr upjisg upjpnrm upjpngt ; do \
		$(PLTOTF) upjisr-v.pl $$fnt-v.tfm ; \
	done
	for hv in h v ; do \
	for fnt in upkorrm upkorgt ; do \
		$(PLTOTF) upkorr-$$hv.pl $$fnt-$$hv.tfm ; \
	done ; \
	for fnt in upschrm upschgt ; do \
		$(PLTOTF) upschr-$$hv.pl $$fnt-$$hv.tfm ; \
	done ; \
	for fnt in uptchrm uptchgt ; do \
		$(PLTOTF) uptchr-$$hv.pl $$fnt-$$hv.tfm ; \
	done ; \
	done
	for fnt in upjisr-hq upjisg-hq ; do \
		$(PLTOTF) upjisr-h.pl $$fnt.tfm ; \
	done

pstfm:
	for fnt in uprml upgbm ; do \
		$(PLTOTF) uprml-h-hk.pl $$fnt-h.tfm ; \
	done
	for fnt in uphysmjm uphygt upstsl upstht upmsl upmhm ; do \
		$(PLTOTF) uprml-h.pl $$fnt-h.tfm ; \
	done
	for fnt in uprml upgbm ; do \
		$(PLTOTF) uprml-h.pl $$fnt-hq.tfm ; \
	done

vf:
#	$(MAKEJVFJ) -e -H -U upjisr-hq upjisr-h.tfm uprml-h
#	$(MAKEJVFJ) -e -H -U upjisg-hq upjisg-h.tfm upgbm-h
#	$(MAKEJVFJ) -e upjisr-v.tfm uprml-v
#	$(MAKEJVFJ) -e upjisg-v.tfm upgbm-v
	$(MAKEJVFX) -e -t makejvf-upjis.cnf -H -U upjisr-hq upjisr-h.tfm uprml-h
	$(MAKEJVFX) -e -t makejvf-upjis.cnf -H -U upjisg-hq upjisg-h.tfm upgbm-h
	$(MAKEJVFX) -e -t makejvf-upjis.cnf upjisr-v.tfm uprml-v
	$(MAKEJVFX) -e -t makejvf-upjis.cnf upjisg-v.tfm upgbm-v
	$(MAKEJVFJQ) -e upjisr-hq.tfm uprml-hq
	$(MAKEJVFJQ) -e upjisg-hq.tfm upgbm-hq
#	$(MAKEJVFJ3) -e -H -U upjisr-hq upjpnrm-h.tfm uprml-h
#	$(MAKEJVFJ3) -e -H -U upjisg-hq upjpngt-h.tfm upgbm-h
#	$(MAKEJVFJ3) -e upjpnrm-v.tfm uprml-v
#	$(MAKEJVFJ3) -e upjpngt-v.tfm upgbm-v
	$(MAKEJVFX) -e -t makejvf-upjpn.cnf -H -U upjisr-hq upjpnrm-h.tfm uprml-h
	$(MAKEJVFX) -e -t makejvf-upjpn.cnf -H -U upjisg-hq upjpngt-h.tfm upgbm-h
	$(MAKEJVFX) -e -t makejvf-upjpn.cnf upjpnrm-v.tfm uprml-v
	$(MAKEJVFX) -e -t makejvf-upjpn.cnf upjpngt-v.tfm upgbm-v
	$(MAKEJVFK) -e upkorrm-h.tfm uphysmjm-h
	$(MAKEJVFK) -e upkorgt-h.tfm uphygt-h
	$(MAKEJVFK) -e upkorrm-v.tfm uphysmjm-v
	$(MAKEJVFK) -e upkorgt-v.tfm uphygt-v
	$(MAKEJVFG3) -e upschrm-h.tfm upstsl-h
	$(MAKEJVFG3) -e upschgt-h.tfm upstht-h
	$(MAKEJVFG3) -e upschrm-v.tfm upstsl-v
	$(MAKEJVFG3) -e upschgt-v.tfm upstht-v
	$(MAKEJVFC3) -e uptchrm-h.tfm upmsl-h
	$(MAKEJVFC3) -e uptchgt-h.tfm upmhm-h
	$(MAKEJVFC3) -e uptchrm-v.tfm upmsl-v
	$(MAKEJVFC3) -e uptchgt-v.tfm upmhm-v

move:
	mkdir -pv ../tfm ../vf
	mv *.tfm ../tfm
	mv *.vf ../vf
