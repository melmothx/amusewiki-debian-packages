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

all: tfm vf vf_cjk add_svs_all pstfm
all_conventional: tfm vf vf_cjk_conventional pstfm

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

vf_cjk_conventional:
	$(MAKEJVFJ3) -e -H -U upjisr-hq upjpnrm-h.tfm uprml-h
	$(MAKEJVFJ3) -e -H -U upjisg-hq upjpngt-h.tfm upgbm-h
	$(MAKEJVFJ3) -e upjpnrm-v.tfm uprml-v
	$(MAKEJVFJ3) -e upjpngt-v.tfm upgbm-v
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

vf_cjk:
	$(MAKEJVFX) -e -t makejvf-upjpn.cnf -H -U upjisr-hq upjpnrm-h.tfm uprml-h
	$(MAKEJVFX) -e -t makejvf-upjpn.cnf -H -U upjisg-hq upjpngt-h.tfm upgbm-h
	$(MAKEJVFX) -e -t makejvf-upjpn.cnf upjpnrm-v.tfm uprml-v
	$(MAKEJVFX) -e -t makejvf-upjpn.cnf upjpngt-v.tfm upgbm-v
	$(MAKEJVFX) -e -t makejvf-upkor.cnf upkorrm-h.tfm uphysmjm-h
	$(MAKEJVFX) -e -t makejvf-upkor.cnf upkorgt-h.tfm uphygt-h
	$(MAKEJVFX) -e -t makejvf-upkor.cnf upkorrm-v.tfm uphysmjm-v
	$(MAKEJVFX) -e -t makejvf-upkor.cnf upkorgt-v.tfm uphygt-v
	$(MAKEJVFX) -e -t makejvf-upsch.cnf upschrm-h.tfm upstsl-h
	$(MAKEJVFX) -e -t makejvf-upsch.cnf upschgt-h.tfm upstht-h
	$(MAKEJVFX) -e -t makejvf-upsch.cnf upschrm-v.tfm upstsl-v
	$(MAKEJVFX) -e -t makejvf-upsch.cnf upschgt-v.tfm upstht-v
	$(MAKEJVFX) -e -t makejvf-uptch.cnf uptchrm-h.tfm upmsl-h
	$(MAKEJVFX) -e -t makejvf-uptch.cnf uptchgt-h.tfm upmhm-h
	$(MAKEJVFX) -e -t makejvf-uptch.cnf uptchrm-v.tfm upmsl-v
	$(MAKEJVFX) -e -t makejvf-uptch.cnf uptchgt-v.tfm upmhm-v

svs_entry:
	perl mk_svs_entry.perl svs_list_j.txt > svs_list_jpn.entry
	perl mk_svs_entry.perl svs_list_c.txt > svs_list_sch.entry
	perl mk_svs_entry.perl svs_list_t.txt > svs_list_tch.entry
	perl mk_svs_entry.perl svs_list_k.txt > svs_list_kor.entry

svs_tex:
	perl -CSD mk_svs_tex.perl svs_list_j.txt > svs_list_jpn.tex
	perl -CSD mk_svs_tex.perl svs_list_c.txt > svs_list_sch.tex
	perl -CSD mk_svs_tex.perl svs_list_t.txt > svs_list_tch.tex
	perl -CSD mk_svs_tex.perl svs_list_k.txt > svs_list_kor.tex

svs_min_tex:
	perl -s -CSD mk_svs_tex.perl -style=min svs_list_j.txt > svs_list_min_jpn.tex

add_svs_all: add_svs_gen add_svs_remove

add_svs_gen:
	for hv in h v ; do \
	for fnt in rm gt ; do \
	for lang in jpn sch tch kor ; do \
		echo "generating (" $$lang ", "  $$fnt ", " $$hv ")..." ; \
		jfmutil vf2zvp0 up$$lang$$fnt-$$hv.vf up$$lang$$fnt-$$hv-00.zvp0 ; \
		cat up$$lang$$fnt-$$hv-00.zvp0 svs_list_$$lang.entry > up$$lang$$fnt-$$hv-01.zvp0 ; \
		jfmutil zvp02vf up$$lang$$fnt-$$hv-01.zvp0 up$$lang$$fnt-$$hv.vf ; \
	done ; \
	done ; \
	done

add_svs_remove:
	rm up*-[hv]-0[01].zvp0

move:
	mkdir -pv ../tfm ../vf
	mv *.tfm ../tfm
	mv *.vf ../vf
