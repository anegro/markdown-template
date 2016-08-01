HTMLDIR=html
PDFDIR=pdf
ODTDIR=odt
CSSDIR=css

vpath %.html $(HTMLDIR)
vpath %.pdf $(PDFDIR)
vpath %.odt $(ODTDIR)

.PHONY: clean

all:
	make pdf
	make html
	make odt


html: $(HTMLS)
	@echo Exporting to HTML


pdf: $(PDFS)
	@echo Exporting to PDF


odt: $(ODTS)
	@echo Exporting to ODT


%.html: %.md
	./utils/md2html.py $< template.html $(HTMLDIR)/$@


%.pdf: %.md %.css $(CSSDIR)/*/*.css
	./utils/md2pdf.sh $< $(PDFDIR)/$@ $*.css


%.odt: %.md %.css $(CSSDIR)/*/*.css
	./utils/md2odt.sh $< $(ODTDIR)/$@ $*.css


clean:
	for i in $(HTMLS); do rm $(HTMLDIR)/$$i; done; true
	for i in $(PDFS); do rm $(PDFDIR)/$$i; done; true
	for i in $(ODTS); do rm $(ODTDIR)/$$i; done; true

