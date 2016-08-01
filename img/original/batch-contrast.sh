#!/bin/bash

BLACK=0%
WHITE=70%
GAMMA=0.5

echo -e "Starting conversion...\n"


for f in `ls *.jpg *.jpeg 2> /dev/null`
do
	if [ -f $f ]; then
		CONVERT=1
	fi
	
	if [ -f ../$f -a $OVERWRITE = 0 ]; then
		CONVERT=0
	fi

	if [ $CONVERT = 1 ]; then
		echo "$f..."
		convert +antialias -type Grayscale -level $BLACK,$WHITE,$GAMMA $f ../$f
	elif [ $VERBOSE = 1 ]; then
		echo "    (skipping): $f..."
	fi
done

echo -e "\nDone"

