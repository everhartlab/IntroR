HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard docs/*.Rmd))
HTML_FILES := $(filter-out docs/_sessionInfo.html, $(HTML_FILES))

.PHONY: all
all : html

.PHONY : html
html : $(HTML_FILES)

%.html : %.Rmd
	R --slave -e "rmarkdown::render_site('$<')"

.PHONY : clean
clean :
	R --slave -e "rmarkdown::clean_site('docs')"