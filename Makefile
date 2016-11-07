SOURCE = article.md document.md exam.md keynotes.md README.md test.md
PDFS = $(SOURCE:.md=.pdf)
HTMLS = $(SOURCE:.md=.html)
ODTS = $(SOURCE:.md=.odt)

include utils/Master.mk
