Markdown
========

This is the style guideline for Markdown documents.


Rules
-----

  1. Only `===` or `---` headers.
  2. Two spaces above a `===`, `---`, or `**Lorem Ipsum**` headers.
  3. One space below a `===`, `---`, or `**Lorem Ipsum**` headers headers.
  4. Only enough header `===` or `---` lines as the length of the titles
  5. The `===` header is used for the file name/true name.
  6. The `---` header is used for main sections.
  7. The `**Lorem Ipsum**` sub-header is used for sub-sections
  8. Use *\`\`\` languagename ... \`\`\`* for code blocks.
  9. One space below and above code-blocks and lists.
  10. One sentence per line (Markdown will concatinate them)
  11. One empty space to denote a new paragraph.
  12. For list items with multiple sentences, indent to the first letter
  13. Indent lists at least 2 spaces
  14. For links, always use lettered footnotes (example: FND, RDF, footy)
  15. Footnote links always should be at the bottom of the list


Example
-------

``` markdown
Example
=======

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis [nostrud exercitation ullamco laboris nisi ut aliquip ex ea][linky] commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat [cupidatat non proident][red], sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


This is a section header
------------------------

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud **exercitation ullamco laboris nisi** ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

  * Red Little Lamb
  * Alpha Mega Dual
  * Crossroads Demon Supernatural

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute [irure dolor in reprehenderit][south] in `voluptate` velit esse cillum `dolore` eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

**Subheader Example**

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in *reprehenderit in voluptate* velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


A Code Example
--------------

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

``` ruby
class Account
  field :name
  field :email
end
```

Duis aute irure dolor in *reprehenderit in voluptate* velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

  1. Black Sheep Canvas
  2. iPhone Screen Cracked
  3. Nom Nom Nom

[linky]: http://example.com
[red]: http://example.com
[south]: http://example.com
```
