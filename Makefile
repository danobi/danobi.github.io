SOURCE_DOCS := $(wildcard src/*.md)
EXPORTED_DOCS = $(notdir $(SOURCE_DOCS:.md=.html))
PANDOC_VERSION := 3.5.0
PANDOC := podman run --rm -v $(shell pwd):/data --userns=keep-id pandoc/core:$(PANDOC_VERSION)
PANDOC_OPTIONS = -t markdown-smart --standalone
PANDOC_HTML_OPTIONS = --to html5 --css css/theme.css

%.html : src/%.md Makefile css/theme.css
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) $< -o $@

.PHONY: all
all: $(EXPORTED_DOCS)
