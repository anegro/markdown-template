#! /bin/bash

#RES=72
#RES=100
RES=125

for f in *.png
do
	DIMS=`identify $f | cut -d" " -f3`

	w=`echo $DIMS | cut -d"x" -f1`
	h=`echo $DIMS | cut -d"x" -f2`
	
	c=$[ 254 * $w / ( $RES * 100 ) ]
	
	echo -e "$f\t$c"
done
