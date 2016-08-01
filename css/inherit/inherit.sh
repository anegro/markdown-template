#! /bin/bash

for f in ../common/*.css; do
	BASENAME=`basename $f`
	
	if [ ! -f $BASENAME ]; then
		echo "@import '../common/$BASENAME';" > $BASENAME
	fi
done
