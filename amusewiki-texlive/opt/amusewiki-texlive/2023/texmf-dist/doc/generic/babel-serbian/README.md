----------------------------------------------------------------

# Serbian Latin language module for Babel, v2.2a

Released under the LaTeX Project Public License v1.3 or later.
See http://www.latex-project.org/lppl.txt

The package provides support for use of Babel in documents written in Serbian Latin
(in ekavian or ijekavian dialect). The support is adapted for use both
under legacy TeX engines, and under XeTeX and LuaTeX.

The Current Maintainer is Uroš Stefanović.

## USAGE

Serbian language definition file can be used both with legacy 8-bit engines
(such as latex.exe or pdflatex.exe) and Unicode compilers (xelatex.exe or
lualatex.exe).

Typesetting in ijekavian dialect:

    \usepackage[english,serbian]{babel}
    \languageattribute{serbian}{ijekav}
or

    \usepackage[english,serbian.ijekav]{babel}
	
Also, the attributes 'datei' and 'quotes' are defined.

## CHANGES v2.2a

Spurious spaces removed.

## CHANGES v2.2

New date formats are available.

## CHANGES v2.1

New enumeration alphabets are available.

## DOCUMENTATION

See serbian.pdf for more information.
