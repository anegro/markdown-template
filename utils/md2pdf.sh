#! /bin/bash

if [ $# -ne 3 ]; then
	echo "*** ERROR: The parameters must be: <input> <output> <style>"
	exit 1
fi

INPUT=$1
OUTPUT=$2
STYLE=$3
FIFO=./md2pdf
MDPY="markdown_py -v -e utf-8 -x markdown.extensions.admonition -x markdown.extensions.tables -x markdown.extensions.toc -x markdown.extensions.codehilite -x markdown.extensions.fenced_code -x markdown.extensions.attr_list -x markdown.extensions.abbr -x markdown.extensions.footnotes"

mkfifo $FIFO

(cat << EOF
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<title>$INPUT</title>
</head>
<body>
EOF

$MDPY $INPUT

echo -e "\n</body>\n</html>") > $FIFO &

weasyprint -s $STYLE -f pdf $FIFO $OUTPUT

rm $FIFO

