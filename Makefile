SOURCE_DOCS := $(wildcard src/*.md)
SOURCE_ADOCS := $(wildcard src/docs/*.adoc)

EXPORTED_DOCS = $(notdir $(SOURCE_DOCS:.md=.html))
EXPORTED_ADOCS = $(addprefix docs/,$(notdir $(SOURCE_ADOCS:.adoc=.html)))

PANDOC_VERSION := 3.5.0
PANDOC := podman run --rm -v $(shell pwd):/data --userns=keep-id pandoc/core:$(PANDOC_VERSION)
PANDOC_OPTIONS = -t markdown-smart --standalone
PANDOC_HTML_OPTIONS = --to html5 --css css/theme.css

ASCIIDOCTOR_VERSION := 1.79
ASCIIDOCTOR := podman run --rm -v $(shell pwd):/documents --userns=keep-id asciidoctor/docker-asciidoctor:$(ASCIIDOCTOR_VERSION) asciidoctor

.PHONY: all
all: $(EXPORTED_DOCS) $(EXPORTED_ADOCS)

%.html : src/%.md Makefile css/theme.css
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) $< -o $@

docs/%.html: src/docs/%.adoc src/header.html src/footer.html | docs
	$(ASCIIDOCTOR) --no-header-footer $< -o - | cat src/header.html - src/footer.html > $@
