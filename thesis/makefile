all: sherrill-Mix_thesis.pdf

sherrill-Mix_thesis.pdf: sherrill-Mix_thesis.tex */*.tex headMatter.tex penn_thesis_style.sty appendices/*/*.tex
	pdflatex -output-directory tmp sherrill-Mix_thesis
	bibtex tmp/sherrill-Mix_thesis
	pdflatex -output-directory tmp sherrill-Mix_thesis
	pdflatex -output-directory tmp sherrill-Mix_thesis
	cp tmp/sherrill-Mix_thesis.pdf .
