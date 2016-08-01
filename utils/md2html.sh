#! /bin/bash

if [ $# -ne 2 ]; then
	echo "*** ERROR: Input file and output file required"
	exit 1
fi

INPUT=$1
OUTPUT=$2
#OUTPUT=/dev/stdout
MDPY="markdown_py -v -e utf-8 -x markdown.extensions.admonition -x markdown.extensions.tables -x markdown.extensions.toc -x markdown.extensions.codehilite -x markdown.extensions.fenced_code -x markdown.extensions.attr_list -x markdown.extensions.abbr -x markdown.extensions.footnotes"

cat > $2 << EOF
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="css/web/style.css">
	<title>$INPUT</title>
</head>
<body>
EOF

$MDPY $INPUT >>  $OUTPUT

echo -e "\n</body>\n</html>" >> $OUTPUT

