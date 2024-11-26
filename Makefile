all: Makefile.in

-include Makefile.in

RELEASE:=$(shell grep em:version install.rdf | head -n 1 | sed -e 's/ *<em:version>//' -e 's/<\/em:version>//')

xpi: FORCE
	mkdir -p release
	rm -f release/zotk_v$(version).xpi
	zip -r release/zotfile_v${RELEASE}.xpi chrome chrome.manifest defaults install.rdf -x \*.DS_Store

Makefile.in: install.rdf
	echo "all: zotfile_v${RELEASE}.xpi" > Makefile.in

FORCE:
