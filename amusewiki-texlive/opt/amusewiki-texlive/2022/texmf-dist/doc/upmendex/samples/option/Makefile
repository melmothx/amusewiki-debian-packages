UPMENDEX = upmendex

#
# test for icu_rules
#
rules:
	for sty in rule0; do \
		$(UPMENDEX) -f attri1.idx -s mdxsty_$$sty.ist -o attri1_$$sty.ind ; \
	done

#
# test for Japanese
#
jp_u:
	for sty in 00 01 02; do \
		$(UPMENDEX) japanese.idx -s mdxsty_j$$sty.ist -o japanese_$$sty-umdx.ind ; \
		$(UPMENDEX) japanese.idx -l -s mdxsty_j$$sty.ist -o japanese_l_$$sty-umdx.ind ; \
		$(UPMENDEX) japanese.idx -c -s mdxsty_j$$sty.ist -o japanese_c_$$sty-umdx.ind ; \
		$(UPMENDEX) japanese.idx -l -c -s mdxsty_j$$sty.ist -o japanese_lc_$$sty-umdx.ind ; \
		$(UPMENDEX) japanese.idx -r -s mdxsty_j$$sty.ist -o japanese_r_$$sty-umdx.ind ; \
		$(UPMENDEX) japanese.idx -g -s mdxsty_j$$sty.ist -o japanese_g_$$sty-umdx.ind ; \
	done

clean:
	rm -f *.ind *.ilg
