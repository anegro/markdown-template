#! /bin/bash

#RES=72
#RES=100
RES=125


# Pasar como parámetro opcional el directorio donde se encuentran las imágenes
if [ $# = 1 ]; then
	DIR=$1
else
	DIR=""
fi


#![](img/tema1/mod-jerarquico.png)
#Titulo de la imagen
#{: .figure style="width: 10cm"}
for f in *.png
do
	DIMS=`identify $f | cut -d" " -f3`

	w=`echo $DIMS | cut -d"x" -f1`
	h=`echo $DIMS | cut -d"x" -f2`
	
	c=$[ 254 * $w / ( $RES * 100 ) ]
	
	#echo -e "$f\t$c"
	echo -e '![]('$DIR$f')'
	echo -e '{: .figure style="width: '$c'cm"}\n'
done
