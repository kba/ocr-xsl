MKDIR = mkdir -p
GIT = git
WGET = wget
PATH := $(PATH):build-deps/shinclude
SHINCLUDE = shinclude

.PHONY: test all docs

all: build-deps docs

#------------------------------------------------------------------------------
# Build dependencies
#------------------------------------------------------------------------------
build-deps: build-deps/shinclude
build-deps/shinclude:
	$(GIT) clone https://github.com/kba/shinclude "$@"

#------------------------------------------------------------------------------
# Tests
#------------------------------------------------------------------------------
TSHT_URL = https://rawgit.com/kba/tsht/master/test/tsht
test/tsht:
	$(MKDIR) test && $(WGET) -O "$@" "$(TSHT_URL)"
test:
	./test/tsht

#------------------------------------------------------------------------------
# README
#------------------------------------------------------------------------------
docs: README.md OCR-Format-Comparison.md

OCR-Format-Comparison.md: doc/OCR-Format-Comparison.md
	$(SHINCLUDE) -p doc -c xml "$<" > "$@"

README.md: doc/README.md $(wildcard xsl-functions/*)
	$(SHINCLUDE) -c xml doc/README.md > "$@"
