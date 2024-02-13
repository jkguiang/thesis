.PHONY: clean

all: build log
clean:
	rm -f *.blg
	rm -f *.out
	rm -f *.bbl
	rm -f *.log
	rm -f *.ind
	rm -f *.ilg
	rm -f *.lot
	rm -f *.lof
	rm -f *.idx
	rm -f *.aux
	rm -f *.toc
	rm -f thesis.pdf
	rm -f output.pdf
	rm -f smalloutput.pdf
	rm -f *.fdb_latexmk
	rm -f *.fls
	rm -f *.synctex.gz
image:
	- docker build -t thesis-workspace .
container-start:
	- docker run --name=thesis --volume=${PWD}:/thesis --detach thesis-workspace
container-stop:
	- docker stop thesis
	- docker rm thesis
	- docker system prune -f --volumes
container-login:
	- docker exec -it thesis /bin/bash
draft:
	- docker exec -it thesis /bin/bash -c "pdflatex -pdf thesis.tex"
	- rm -f *.aux
	- rm -f tex/*.aux
	- rm -f tex/appendices/*.aux
build:
	- docker exec -it thesis /bin/bash -c "latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf thesis.tex"
	- rm -f *.aux
	- rm -f tex/*.aux
	- rm -f tex/appendices/*.aux
push:
	- git commit -a -m "updated"
	- git push
