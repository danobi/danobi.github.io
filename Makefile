SOURCE_DOCS := $(wildcard src/*.md)
EXPORTED_DOCS = $(notdir $(SOURCE_DOCS:.md=.html))
PANDOC = /bin/env pandoc
PANDOC_OPTIONS = -t markdown-smart --standalone
PANDOC_HTML_OPTIONS = --to html5 --css css/theme.css

%.html : src/%.md Makefile css/theme.css
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) $< -o $@

.PHONY: all
all: $(EXPORTED_DOCS)
