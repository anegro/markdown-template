# markdown-template

Template to compose books, slides and articles in Markdown and export them to PDF, ODT and HTML


## Requirements

- **Ubuntu** 14.04 or other compatible Linux distribution.
- **Python** 2.7 or later.
- Several Python packages:
	- **markdown**, to support markdown conversion to HTML.
	- **pygments**, as syntax highlighter.
	- **weasyprint**, to convert from HTML to PDF.
- **LibreOffice**, to support ODT conversion.
- **Font Awesome** TTF font, to support admonition icons.
- **make** utility to build target formats from Markdown.


## Installation of utilities

Install some Python utilities along with some libraries and other stuff:

~~~
sudo apt-get install python-dev python-pip python-lxml libcairo2 libpango1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info libxslt-dev make
~~~

Use `pip` to install Python packages:

~~~
sudo pip install markdown
sudo pip install pygments
sudo pip install weasyprint
~~~

Install [Font Awesome](http://fontawesome.io/) TTF font and check correct installation:

~~~
sudo apt-get install fonts-font-awesome
fc-list | grep awesome
~~~

Optionally, you can install an easy to use Markdown editor like [ReText](https://github.com/retext-project/retext), from Ubuntu repositories:

~~~
sudo apt-get install retext
~~~

Or you can install the latest version using `pip` (requires Python 3):

~~~
sudo pip install retext
~~~


## Basic usage

The template contains the following types of **basic documents**:

- **Article**, for simple compositions.
- **Document**, for more complex and structured stuff like books.
- **Keynotes**, for slides.

Each kind of document consists of two main files: a **markdown** (`.md`) file and a **stylesheet** (`.css`) file. If you are writing a book, for example, you will be using `document.md` and `document.css` as a starting point:

- `document.md` will be used to write all the contents of your book.
- `document.css` can be used to customize the default CSS style by overriding some rules.

To export your Markdown to PDF, HTML and ODT, use the `make` utility:

~~~
make
~~~

The output will be placed inside `html`, `odt` and `pdf` directories.

You don't have to obey the default filenames. For example, you can rename `document.md` to `mybook.md` and use the utility script `generate-makefile.sh` to automatically update the `Makefile`. In that case, you will have to name the stylesheet `mybook.css`, just like the Markdown file. That's the only restriction.
