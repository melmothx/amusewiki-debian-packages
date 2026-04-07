include ../Common.mak

pdftex21 = /opt/texlive/2020/bin/local/pdftex-tl21
pdftex22 = /opt/texlive/2020/bin/local/pdftex-tl22
pdftex23 = /opt/texlive/2020/bin/local/pdftex-tl23
pdftex24 = /opt/texlive/2020/bin/local/pdftex-tl24
pdftex25 = /opt/texlive/2020/bin/local/pdftex2
pdflatex24 = $(pdftex24) -fmt pdflatex-24
pdflatex25 = $(pdftex25) -fmt pdflatex-25
cmp_vimdiff = vimdiff
cmp_visual = ./compare_pdfs.rb

cmp_vimdiff = true

test:
	# $(pdftex21) -ini f.tex && mv f.pdf f-21.pdf && ./postpdf.sh f-21.pdf
	# $(pdftex22) -ini f.tex && mv f.pdf f-22.pdf && ./postpdf.sh f-22.pdf
	# $(pdftex23) -ini f.tex && mv f.pdf f-23.pdf && ./postpdf.sh f-23.pdf
	$(pdftex24) -ini f.tex && mv f.pdf f-24.pdf && ./postpdf.sh f-24.pdf
	$(pdftex25) -ini f.tex && mv f.pdf f-25.pdf && ./postpdf.sh f-25.pdf
	$(cmp_visual) f-2[45].pdf --res=300
	$(cmp_vimdiff) -R f-2[45]--pp.pdf

test2:
	# $(pdftex21) -fmt pdflatex-21 f2.tex && mv f2.pdf f2-21.pdf && ./postpdf.sh f2-21.pdf
	# $(pdftex22) -fmt pdflatex-22 f2.tex && mv f2.pdf f2-22.pdf && ./postpdf.sh f2-22.pdf
	# $(pdftex23) -fmt pdflatex-23 f2.tex && mv f2.pdf f2-23.pdf && ./postpdf.sh f2-23.pdf
	$(pdflatex24) f2.tex && mv f2.pdf f2-24.pdf && ./postpdf.sh f2-24.pdf
	$(pdflatex25) f2.tex && mv f2.pdf f2-25.pdf && ./postpdf.sh f2-25.pdf
	$(cmp_visual) f2-2[45].pdf --res=300
	$(cmp_vimdiff) -R f2-2[45]--pp.pdf

test3:
	# $(pdftex21) -fmt pdflatex-21 f3.tex && mv f3.pdf f3-21.pdf && ./postpdf.sh f3-21.pdf
	# $(pdftex22) -fmt pdflatex-22 f3.tex && mv f3.pdf f3-22.pdf && ./postpdf.sh f3-22.pdf
	# $(pdftex23) -fmt pdflatex-23 f3.tex && mv f3.pdf f3-23.pdf && ./postpdf.sh f3-23.pdf
	$(pdflatex24) f3.tex && mv f3.pdf f3-24.pdf && ./postpdf.sh f3-24.pdf
	$(pdflatex25) f3.tex && mv f3.pdf f3-25.pdf && ./postpdf.sh f3-25.pdf
	$(cmp_visual) f3-2[45].pdf --res=300
	$(cmp_vimdiff) -R f3-2[45]--pp.pdf

sample2e:
	make fmt
	# $(pdftex21) -fmt pdflatex-21 sample2e.tex && mv sample2e.pdf sample2e-21.pdf && ./postpdf.sh sample2e-21.pdf
	# $(pdftex22) -fmt pdflatex-22 sample2e.tex && mv sample2e.pdf sample2e-22.pdf && ./postpdf.sh sample2e-22.pdf
	# $(pdftex23) -fmt pdflatex-23 sample2e.tex && mv sample2e.pdf sample2e-23.pdf && ./postpdf.sh sample2e-23.pdf
	$(pdflatex24) sample2e.tex && mv sample2e.pdf sample2e-24.pdf && ./postpdf.sh sample2e-24.pdf
	$(pdflatex25) sample2e.tex && mv sample2e.pdf sample2e-25.pdf && ./postpdf.sh sample2e-25.pdf
	$(cmp_visual) sample2e-2[45].pdf --res=300
	$(cmp_vimdiff) -f -R sample2e-2[45]--pp.pdf

a1:
	$(pdflatex24) a1.tex
	$(pdflatex24) a1.tex
	$(pdflatex24) a1.tex
	mv a1.pdf a1-24.pdf && ./postpdf.sh a1-24.pdf
	$(pdflatex25) a1.tex
	$(pdflatex25) a1.tex
	$(pdflatex25) a1.tex
	mv a1.pdf a1-25.pdf && ./postpdf.sh a1-25.pdf
	$(cmp_visual) a1-2[45].pdf --res=300
	$(cmp_vimdiff) -R a1-2[45]--pp.pdf

a2:
	$(pdflatex24) a2.tex
	$(pdflatex24) a2.tex
	$(pdflatex24) a2.tex
	mv a2.pdf a2-24.pdf && ./postpdf.sh a2-24.pdf
	$(pdflatex25) a2.tex
	$(pdflatex25) a2.tex
	$(pdflatex25) a2.tex
	mv a2.pdf a2-25.pdf && ./postpdf.sh a2-25.pdf
	$(cmp_visual) a2-2[45].pdf --res=300 --res=300
	$(cmp_vimdiff) -R a2-2[45]--pp.pdf

a3:
	$(pdflatex24) a3.tex
	$(pdflatex24) a3.tex
	$(pdflatex24) a3.tex
	mv a3.pdf a3-24.pdf && ./postpdf.sh a3-24.pdf
	$(pdflatex25) a3.tex
	$(pdflatex25) a3.tex
	$(pdflatex25) a3.tex
	mv a3.pdf a3-25.pdf && ./postpdf.sh a3-25.pdf
	$(cmp_visual) a3-2[45].pdf --res=300 --res=300
	$(cmp_vimdiff) -R a3-2[45]--pp.pdf

texlive-en:
	$(pdflatex24) texlive-en.tex
	# $(pdflatex24) texlive-en.tex
	# $(pdflatex24) texlive-en.tex
	mv texlive-en.pdf texlive-en-24.pdf && ./postpdf.sh texlive-en-24.pdf
	$(pdflatex25) texlive-en.tex
	# $(pdflatex25) texlive-en.tex
	# $(pdflatex25) texlive-en.tex
	mv texlive-en.pdf texlive-en-25.pdf && ./postpdf.sh texlive-en-25.pdf
	$(cmp_visual) texlive-en-2[45].pdf --res=300
	$(cmp_vimdiff) -R texlive-en-2[45]--pp.pdf

fmt:
	# $(pdftex21) -ini -etex -env pdflatex.ini && mv pdflatex.fmt pdflatex-21.fmt
	# $(pdftex22) -ini -etex -env pdflatex.ini && mv pdflatex.fmt pdflatex-22.fmt
	# $(pdftex23) -ini -etex -env pdflatex.ini && mv pdflatex.fmt pdflatex-23.fmt
	$(pdftex24) -ini -etex -env pdflatex.ini && mv pdflatex.fmt pdflatex-24.fmt
	$(pdftex25) -ini -etex -env pdflatex.ini && mv pdflatex.fmt pdflatex-25.fmt

clean:
	$(clean)
