
FILE_IPYNB = $(shell find notebooks -type f -name '*.ipynb')
FILE_HTML  = $(patsubst %.ipynb, %.html, $(FILE_IPYNB))

all: $(FILE_HTML) index.html

rename: FORCE
	./rename_notebooks.sh

%.html: %.ipynb
	jupyter nbconvert --to html $^

index.html: FORCE
	find notebooks -type f -name '*.html' | sort | xargs -I{} echo '<li><a href="{}">{}</a></li>' > index.html

FORCE:
.PHONY: FORCE
