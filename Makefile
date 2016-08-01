SOURCE = article.md document.md keynotes.md
PDFS = $(SOURCE:.md=.pdf)
HTMLS = $(SOURCE:.md=.html)
ODTS = $(SOURCE:.md=.odt)

include utils/Master.mk
