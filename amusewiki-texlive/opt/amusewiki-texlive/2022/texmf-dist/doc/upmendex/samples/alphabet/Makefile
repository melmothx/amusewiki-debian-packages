UPMENDEX = upmendex

alphabet: es zh

es:
	for num in 1 2; do \
	for loc in es; do \
		$(UPMENDEX) alpha_$$loc.idx -s mdxsty_head$$num.ist -s mdxsty_$$loc.ist -t alpha_$$loc$$num.ilg -o alpha_$$loc$$num.ind ; \
	done ; \
	done
	for num in 1 2 3; do \
	for x in 1 2; do \
	for loc in es; do \
		locx=$$loc$$x ; \
		$(UPMENDEX) alpha_$$loc.idx -s mdxsty_head$$num.ist -s mdxsty_$$locx.ist -t alpha_$$locx$$num.ilg -o alpha_$$locx$$num.ind ; \
	done ; \
	done ; \
	done

zh:
	for num in 1 2 3 11 12 13 14 21 22 31; do \
	for loc in zh; do \
		$(UPMENDEX) alpha_$$loc.idx -s mdxsty_$$loc$$num.ist -t alpha_$$loc$$num.ilg -o alpha_$$loc$$num.ind ; \
	done ; \
	done
	for num in 11 12 13 14; do \
		loc='zh' ; \
		locx='zhr' ; \
		$(UPMENDEX) alpha_$$locx.idx -s mdxsty_$$loc$$num.ist -t alpha_$$locx$$num.ilg -o alpha_$$locx$$num.ind ; \
	done
	for num in 21 22; do \
		loc='zh' ; \
		locx='zhs' ; \
		$(UPMENDEX) alpha_$$locx.idx -s mdxsty_$$loc$$num.ist -t alpha_$$locx$$num.ilg -o alpha_$$locx$$num.ind ; \
	done
	for num in 31; do \
		loc='zh' ; \
		locx='zhz' ; \
		$(UPMENDEX) alpha_$$locx.idx -s mdxsty_$$loc$$num.ist -t alpha_$$locx$$num.ilg -o alpha_$$locx$$num.ind ; \
	done
	for num in 1 2 3; do \
		loc='zh' ; \
		locx='zhp' ; \
		$(UPMENDEX) alpha_$$locx.idx -s mdxsty_$$loc$$num.ist -t alpha_$$locx$$num.ilg -o alpha_$$locx$$num.ind ; \
	done

clean:
	rm -f *.ind *.ilg
