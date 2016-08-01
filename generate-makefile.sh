#! /bin/bash

########################################################################

SOURCE=`echo *.md`

(
echo "SOURCE = $SOURCE"
echo 'PDFS = $(SOURCE:.md=.pdf)' 
echo 'HTMLS = $(SOURCE:.md=.html)'
echo 'ODTS = $(SOURCE:.md=.odt)'
echo
echo "include utils/Master.mk"
) > Makefile
