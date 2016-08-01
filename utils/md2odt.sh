#! /bin/bash

if [ $# -ne 3 ]; then
	echo "*** ERROR: The parameters must be: <input> <output> <style>"
	exit 1
fi

INPUT=$1
OUTPUT=$2
STYLE=$3
TMPFILE=./md2odt
MDPY="markdown_py -v -e utf-8 -x markdown.extensions.admonition -x markdown.extensions.tables -x markdown.extensions.toc -x markdown.extensions.codehilite -x markdown.extensions.fenced_code"


(cat << EOF
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="$STYLE">
	<title>$INPUT</title>
</head>
<body>
EOF

$MDPY $INPUT

echo -e "\n</body>\n</html>") > $TMPFILE.html

sed -i 's/.svg/.png/g' $TMPFILE.html
libreoffice --headless --convert-to odt $TMPFILE.html
#pandoc -t odt -o $TMPFILE.odt $TMPFILE.html

rm $TMPFILE.html
mv $TMPFILE.odt $OUTPUT
