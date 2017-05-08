HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard docs/*.Rmd))
HTML_FILES := $(filter-out docs/_sessionInfo.html, $(HTML_FILES))

.PHONY: all
all : docs/index.Rmd html

.PHONY : html
html : $(HTML_FILES)

docs/index.Rmd : README.md
	sed '1d' README.md > docs/index.Rmd

%.html : %.Rmd
	R --slave -e "rmarkdown::render_site('$<')"

.PHONY : clean
clean :
	R --slave -e "rmarkdown::clean_site('docs')"