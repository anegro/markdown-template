#! /bin/bash

#for f in *.pdf
for f in article.pdf document.pdf keynotes.pdf
do
	convert -density 300 $f -quality 100 -resize 960x -background white -alpha remove +adjoin $f-%02d.tmp.png
	montage +polaroid -geometry 512x512-10-3 *.tmp.png $f.png
	#montage -background Silver -geometry 512x512+4+4 *.tmp.png $f.png
	rm *.tmp.png
done

