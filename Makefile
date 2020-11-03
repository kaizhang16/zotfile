all: Makefile.in

-include Makefile.in

RELEASE:=$(shell grep em:version install.rdf | head -n 1 | sed -e 's/ *<em:version>//' -e 's/<\/em:version>//')

zotfile.xpi: FORCE
	zip -r $@ chrome chrome.manifest defaults install.rdf -x \*.DS_Store

zotfile_%.xpi: zotfile.xpi
	mv $< $@

Makefile.in: install.rdf
	echo "all: zotfile_v${RELEASE}.xpi" > Makefile.in

FORCE:
