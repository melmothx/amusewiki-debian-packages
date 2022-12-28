UPMENDEX = upmendex

all: scripts styles

scripts:
	for scr in french german greek russian korean; do \
		$(UPMENDEX) $$scr -s mdxsty00.ist ; \
	done

styles:
	for num in 00 01 02 03; do \
		$(UPMENDEX) multi.idx -s mdxsty$$num.ist -t multi_$$num.ilg -o multi_$$num.ind ; \
	done

compare:
	for ind in $(wildcard *.ind); do \
		diff -qs $$ind output/$$ind ; \
	done

clean:
	rm -f *.ind *.ilg
