----------------------------------------------------------------

# Serbian Cyrillic language module for Babel, v3.1

Released under the LaTeX Project Public License v1.3 or later.
See http://www.latex-project.org/lppl.txt

The package provides support for use of Babel in documents written in Serbian Cyrillic
(in ekavian or ijekavian dialect). The support is adapted for use both
under legacy TeX engines, and under XeTeX and LuaTeX.

The Current Maintainer is Uroš Stefanović.

## USAGE

Serbianc language definition file can be used both with legacy 8-bit engines
(such as latex.exe or pdflatex.exe) and Unicode compilers (xelatex.exe or
lualatex.exe). The Unicode engines can be run either in Unicode mode or 8-bit
compatibility mode, which emulates the legacy engines. The two modes differ by
a set of packages loaded in the preamble of a source TeX file. It is important
to keep the recommended order of the packages loaded, especially when running
Unicode engines in a compatibility 8-bit mode.

In the examples below, it is assumed that a source file has utf8 input encoding.

  8-bit mode:

    \usepackage[T1,T2A]{fontenc}
    \usepackage[utf8]{inputenc}
    \usepackage[english,serbanc]{babel}

  Unicode mode, LuaLaTeX or XeLaTeX

    \usepackage{fontspec}
        \defaultfontfeatures{Ligatures={TeX},Language=Serbian,Script=Cyrillic}
        \setmainfont{CMU Serif}
        \setsansfont{CMU Sans Serif}
        \setmonofont{CMU Typewriter Text}
    \usepackage[english,serbianc]{babel}

Typesetting in ijekavian dialect:

    \usepackage[english,serbianc]{babel}
    \languageattribute{serbianc}{ijekav}
or

    \usepackage[english,serbianc.ijekav]{babel}
	
Also, the attributes 'datei' and 'quotes' are defined.

## CHANGES v3.1

New enumeration alphabets are available.

## DOCUMENTATION

See serbianc.pdf for more information.
