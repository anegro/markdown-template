#! /usr/bin/python

import sys
import re
import codecs
import markdown


def	main(argv):
	if len(argv) != 4:
		printUsage(argv[0])

	else:
		# Markdown Extensions
		extensions=['toc', 'tables', 'codehilite', 'fenced_code', 'admonition', 'attr_list', 'abbr', 'footnotes']

		# Get arguments
		sourceFileName = argv[1]
		templateFileName = argv[2]
		targetFileName = argv[3]

		# Open files
		sourceFile = codecs.open(sourceFileName, "r", encoding='utf-8')
		templateFile = codecs.open(templateFileName, "r", encoding='utf-8')
		targetFile = codecs.open(targetFileName, "w", encoding='utf-8')

		# Read files contents
		sourceText = sourceFile.read()
		templateText = templateFile.read()

		# Convert markdown source file to HTML
		htmlContents = markdown.markdown(sourceText, extensions)

		# Get rid of file extension
		title = getFileName(sourceFileName)

		dictionary = {
			r'%PAGENAME%': title,
			r'%EXTRAHEADERS%': '',
			r'%CONTENT%': htmlContents
		}

		# Apply the template
		targetFile.write(parse_vars(templateText, dictionary))


def getFileName(text):
	match = re.match(r'(.*)\.([^\.]*)', text)

	if match == None:
		fileName = text
	else:
		fileName = match.group(1)

	return fileName


def parse_vars(templateText, dictionary):
	filledTemplate = templateText
	
	for (pattern, value) in dictionary.items():
		filledTemplate = re.sub(pattern, value, filledTemplate, 0, re.UNICODE)
	
	return filledTemplate


def printUsage(program):
	print("Usage: %s <source> <template> <target>" % program)
	print("")


if __name__ == '__main__':
	reload(sys)  
	sys.setdefaultencoding('utf8')
	main(sys.argv)
