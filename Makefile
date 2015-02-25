all: $(patsubst %.md,%.pdf,$(wildcard *.md))

%.pdf: %.md
	pandoc -S --no-tex-ligatures --latex-engine=xelatex \
	  --template cucl-letter-header.latex \
	  -o $@ $<

%.pdf: %.tex
	latexmk -pdf -xelatex $*

clean:
	$(RM) $(patsubst %.md,%.pdf,$(wildcard *.md))
	latexmk -C
