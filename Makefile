%.tex: %.md
	pandoc -S --no-tex-ligatures --latex-engine=xelatex \
	  --template cucl-letter-header.latex \
	  -o $@ $<

%.pdf: %.tex
	latexmk -pdf -xelatex $*

clean:
	latexmk -C
	$(RM) $(patsubst %.md,%.pdf,$(wildcard *.md))
	$(RM) $(patsubst %.tex,%.pdf,$(wildcard *.tex))
	$(RM) *.aux *.fdb_latexmk *.fls *.log
