#! /bin/bash

#RES=72
#RES=100
RES=125


# Pasar como parámetro opcional la resolución
if [ $# = 1 ]; then
	RES=$1
fi

for f in *.png
do
	DIMS=`identify $f | cut -d" " -f3`

	w=`echo $DIMS | cut -d"x" -f1`
	h=`echo $DIMS | cut -d"x" -f2`
	
	#c=$[ 254 * $w / ( $RES * 100 ) ]
	c=$( echo "scale=1; 254 * $w / ( $RES * 100 )" | bc -l )
	
	echo -e "$f\t$c"
done
