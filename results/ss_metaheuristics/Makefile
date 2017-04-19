all: pdf

pdf:
	python3 table_generator.py -i gls.json -o gls.tex -c 0.01191
	python3 table_generator.py -i ils.json -o ils.tex -c 0.01128
	python3 table_generator.py -i sa.json -o sa.tex -c 0.01681
	python3 table_generator.py -i vns.json -o vns.tex -c 0.01124
	pdflatex sa.tex
	pdflatex ils.tex
	pdflatex gls.tex
	pdflatex vns.tex

clean:
	rm -f ./*.aux sa.log ils.log gls.log vns.log
