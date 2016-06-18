NAME=slides_dsn2016
PAPER=$(NAME).tex

default:
	pdflatex \\nonstopmode\\input $(PAPER)
	pdflatex \\nonstopmode\\input $(PAPER)
all:
	pdflatex \\nonstopmode\\input $(PAPER)

handout:
	./handout.sh $(NAME).pdf

clean:
	rm -f *.aux *.bbl *log *.blg *.toc *.snm *.out *.nav *.vrb
