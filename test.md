!!! frontpage "Markdown Template"
	Simple Test

Table of contents
{: .toc}

[TOC]



# Markdown Template

## Basic Markdown Formatting


### Headings

~~~
# Heading 1
## Heading 2
### Heading 3
~~~


### Text

~~~
*italic*
**bold**
***bold-italic***
[link](http://example.com)
~~~

*italic*
**bold**
***bold-italic***
[link](http://example.com)


### Lists

~~~
- Milk
- Bread
    - Wholegrain
- Butter

1. Tidy the kitchen  
2. Prepare ingredients  
3. Cook delicious things  
~~~

Unordered list:

* Milk
* Bread
    * Wholegrain
* Butter

Ordered list:

1. Tidy the kitchen
2. Prepare ingredients
3. Cook delicious things

&nbsp;

### Images

~~~
![Emborio - Emporio - Santorini - Greece](img/santorini.jpg)
~~~

![Emborio - Emporio - Santorini - Greece](img/santorini.jpg)


### Horizontal Rules

~~~
---
~~~

---


### Quotes

~~~
> To be or not to be, that is the question.
~~~

> To be or not to be, that is the question.


### Code Snippets

~~~
Some text with an inline `code` snippet  
~~~

~~~
.my-link {
  text-decoration: underline;
}
~~~

### Reference Lists & Titles

~~~
**The quick brown [fox][1], jumped over the lazy [dog][2].**

[1]: https://en.wikipedia.org/wiki/Fox "Wikipedia: Fox"
[2]: https://en.wikipedia.org/wiki/Dog "Wikipedia: Dog"
~~~

**The quick brown [fox][1], jumped over the lazy [dog][2].**

[1]: https://en.wikipedia.org/wiki/Fox "Wikipedia: Fox"
[2]: https://en.wikipedia.org/wiki/Dog "Wikipedia: Dog"

~~~
[Dog](https://en.wikipedia.org/wiki/Dog "Wikipedia: Dog")
~~~

### Escaping

~~~
\*literally\*
~~~

### Embedding HTML

~~~
<button class="button-save large">Big Fat Button</button>  
~~~

<button class="button-save large">Big Fat Button</button>  

### Explicit Links

~~~
<https://ghost.org>
~~~

<https://ghost.org>


### Tables

~~~
One   | Two   | Three
------|-------|------
four  | five  | six
seven | eight | nine
~~~

One   | Two   | Three
------|-------|------
four  | five  | six
seven | eight | nine


## Admonitions

### Usage

~~~
!!! type "optional explicit title within double quotes"
    Any number of other indented markdown elements.

    This is the second paragraph.
~~~

rST suggests the following types, but you’re free to use whatever you want: `note`, `tip`, `hint`, `attention`, `important`, `caution`, `warning`, `danger`, `error`.

En español: `nota`, `consejo`, `sugerencia`, `atencion`, `importante`, `precaucion`, `advertencia`, `peligro`, `error`.

### Examples

!!! type "Optional explicit title within double quotes"
    Any number of other indented markdown elements.

    This is the second paragraph.

!!! note
    You should note that the title will be automatically capitalized.

!!! tip
    You should note that the title will be automatically capitalized.

!!! hint
    You should note that the title will be automatically capitalized.

!!! attention
    You should note that the title will be automatically capitalized.

!!! important
    You should note that the title will be automatically capitalized.

!!! caution
    You should note that the title will be automatically capitalized.

!!! warning
    You should note that the title will be automatically capitalized.

!!! danger
    You should note that the title will be automatically capitalized.

!!! error
    You should note that the title will be automatically capitalized.


### Ejemplos en español

!!! type "Título opcional entre comillas dobles"
    Cualquier número de elementos indentados en Markdown.

    Este es el segundo párrafo.

!!! nota
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.

!!! consejo
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.

!!! sugerencia
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.

!!! atencion "Atención"
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.

!!! importante
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.

!!! precaucion "Precaución"
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.

!!! advertencia
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.

!!! peligro
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.

!!! error
    Tener en cuenta que el título aparecerá con la inicial en mayúsculas.



## Abbrebiations

### Usage

~~~
The HTML specification 
is maintained by the W3C.

*[HTML]: Hyper Text Markup Language
*[W3C]:  World Wide Web Consortium
~~~

### Examples

The HTML specification 
is maintained by the W3C.

*[HTML]: Hyper Text Markup Language
*[W3C]:  World Wide Web Consortium



## Atribute List

### The List

An example attribute list might look like this:

~~~
{: #someid .someclass somekey='some value' }
~~~

A word which starts with a hash (`#`) will set the id of an element.

A word which starts with a dot (`.`) will be added to the list of classes assigned to an element.

A key/value pair (`somekey='some value'`) will assign that pair to the element.

Be aware that while the dot syntax will add to a class, using key/value pairs will always override the previously defined attribute. Consider the following:

~~~
{: #id1 .class1 id=id2 class="class2 class3" .class4 }
~~~

The above example would result in the following attributes being defined:

~~~
id="id2" class="class2 class3 class4"
~~~

### Block Level

To define attributes for a block level element, the attribute list should be defined on the last line of the block by itself.

~~~
This is a paragraph.
{: #an_id .a_class }
~~~

The above results in the following output:

~~~
<p id="an_id" class="a_class">This is a paragraph.</p>
~~~

The one exception is headers, as they are only ever allowed on one line.

~~~.text
A setext style header {: #setext}
=================================

### A hash style header ### {: #hash }
~~~

The above results in the following output:

~~~
<h1 id="setext">A setext style header</h1>
<h3 id="hash">A hash style header</h3>
~~~

### Inline

To define attributes on inline elements, the attribute list should be defined immediately after the inline element with no white space.

~~~.text
Here is a [link](http://example.com){: class="foo bar" title="Some title!" } to a webpage.
~~~

The above results in the following output:

~~~
<p>Here is a <a href="http://example.com" class="foo bar" title="Some title!">link</a></p> to a webpage.
~~~



## Footnotes

### Usage

~~~
Footnotes[^1] have a label[^@#$%] and the footnote's content.

[^1]: This is a footnote content.
[^@#$%]: A footnote on the label: "@#$%".
~~~

The following options are provided to configure the output:

* `PLACE_MARKER`: A text string used to mark the position where the footnotes are rendered. Defaults to `///Footnotes Go Here///`.
* If the place marker text is not found in the document, the footnote definitions are placed at the end of the resulting HTML document.
* `UNIQUE_IDS`: Whether to avoid collisions across multiple calls to reset(). Defaults to False.
* `BACKLINK_TEXT`: The text string that links from the footnote definition back to the position in the document. Defaults to &#8617;.

## Examples

Footnotes[^1] have a label[^@#$%] and the footnote's content.

[^1]: This is a footnote content.
[^@#$%]: A footnote on the label: "@#$%".
