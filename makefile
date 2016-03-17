all: sherrill-Mix_thesis.pdf sherrill-Mix_abstract.txt

sherrill-Mix_thesis.pdf: sherrill-Mix_thesis.tex */*.tex penn_thesis_style.sty appendices/*/*.tex
	pdflatex -output-directory tmp sherrill-Mix_thesis
	bibtex tmp/sherrill-Mix_thesis
	pdflatex -output-directory tmp sherrill-Mix_thesis
	pdflatex -output-directory tmp sherrill-Mix_thesis
	cp tmp/sherrill-Mix_thesis.pdf .

sherrill-Mix_abstract.txt: sherrill-Mix_thesis.tex generateAbstract.bash
	./generateAbstract.bash sherrill-Mix_thesis.tex>sherrill-Mix_abstract.txt

