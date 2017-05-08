HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard docs/*.Rmd))
HTML_FILES := $(filter-out docs/_sessionInfo.html, $(HTML_FILES))

.PHONY: all
all : html

.PHONY : html
html : docs/index.html docs/data.html $(HTML_FILES)

docs/index.Rmd : README.md
	sed '1d;2d;6d' $< > $@ # remove first, second, and sixth lines

docs/data.Rmd : data/README.md
	cat docs/data.txt $< > $@

%.html : %.Rmd
	R --slave -e "rmarkdown::render_site('$<')"

.PHONY : clean
clean :
	R --slave -e "rmarkdown::clean_site('docs')"