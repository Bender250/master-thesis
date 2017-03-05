filename=thesis

all: pdf

pdf:
	pdflatex -shell-escape -output-directory=build ${filename}.tex
	cp thesis.bib build
	cd build && biber ${filename}.bcf
	pdflatex -shell-escape -output-directory=build ${filename}.tex
	pdflatex -shell-escape -output-directory=build ${filename}.tex
	cp build/${filename}.pdf .

clean:
	rm -f build/${filename}.* build/thesis.bib

read: pdf
	evince ${filename}.pdf &

once:
	pdflatex -output-directory=build ${filename}.tex
	cp build/${filename}.pdf .
