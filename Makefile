RM = rm -rf
UNZIP = unzip
WGET = wget

SAXON_CE_URL = http://www.saxonica.com/ce/download/Saxon-CE_1.1.zip

.PHONY: all serve

all: js index.html xsl-functions

xsl-functions:
	ln -s ../$@ .
test:
	ln -s ../$@ .

index.html: jade/index.jade
	jade -P < "$<" > "$@"

js: js/SaxonceDebug

js/SaxonceDebug:
	cd js && \
		$(WGET) $(SAXON_CE_URL) && \
		$(UNZIP) Saxon-CE_1.1.zip && \
		$(RM) Saxon-CE_1.1.zip && \
		$(RM) notices
serve:
	python -m SimpleHTTPServer

