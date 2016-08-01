#!/bin/bash

# Reduciendo el Tamaño de las Fotos con ImageMagick 
# Reduce a 800x600 o 600x800 ya que respeta la orientación

# Tabla de Resoluciones y Megapixels
#  256 x 192  --  0
#  320 x 240  --  0,1
#  400 x 300  --  0,1
#  512 x 384  --  0,2
#  640 x 480  --  0,3
#  800 x 600  --  0,5
#  832 x 624  --  0,5
#  960 x 720  --  0,7
# 1024 x 768  --  0,8
# 1152 x 864  --  1
# 1280 x 960  --  1,2
# 1400 x 1050 --  1,5
# 1440 x 1080 --  1,6
# 1600 x 1200 --  1,9
# 1792 x 1344 --  2,4
# 1856 x 1392 --  2,6
# 1920 x 1440 --  2,8
# 2048 x 1536 --  3,1
# 2272 x 1704 --  3,9
# 2304 x 1728 --  4
# 2560 x 1920 --  4,9
# 2592 x 1944 --  5
# 2800 x 2100 --  5,9
# 2816 x 2112 --  5,9
# 3072 x 2304 --  7,1
# 3200 x 2400 --  7,7
# 3264 x 2448 --  8
# 3488 x 2616 --  9,1
# 3648 x 2736 -- 10
# 3872 x 2904 -- 11,2
# 4096 x 3072 -- 12,6
# 4288 x 3216 -- 13,8
# 4368 x 3276 -- 14,3
# 4920 x 3264 -- 16
# 4992 x 3744 -- 18,7
# 6400 x 4800 -- 30,7


SCALE=25%
OVERWRITE=0
VERBOSE=0

echo -e "Starting conversion...\n"

#mogrify -resize $SCALE *.png *.PNG

for f in `ls *.png *.PNG 2> /dev/null`
do
	if [ -f $f ]; then
		CONVERT=1
	fi
	
	if [ -f ../$f -a $OVERWRITE = 0 ]; then
		CONVERT=0
	fi

	if [ $CONVERT = 1 ]; then
		echo "$f..."
		convert $f -resize $SCALE ../$f
	elif [ $VERBOSE = 1 ]; then
		echo "    (skipping): $f..."
	fi
done

echo -e "\nDone"
