Belarusian language module for Babel, v1.5
==========================================

Released under the LaTeX Project Public License v1.3c or later.
See http://www.latex-project.org/lppl.txt

The package provides support for use of Babel in documents written in Belarusian
(in both official and ‘classic’ forms). The support is adapted for use both
under legacy TEX engines, and under X∃TEX and LuaTEX.

Based on Russian language module v1.3h by Igor A. Kotelnikov <kia999 at mail dot ru>
and Belarusian language module v1.1l by Aleksey Novodvorsky <aen@logic.ru>.

The current maintainer is Andrej Shadura <andrew@shadura.me>.

Installation
------------

- unpack babel-belarusian.zip
- run `xelatex belarusian.dtx` (recommended)
  or `pdflatex belarusian.dtx`;
  run `tex belarusian.dtx`
  or `tex belarusian.ins`, if you don’t need documentation
- move "belarusian.ldf" to ${texmf}/tex/generic/babel/contrib/
- move "belarusian.pdf" and README to ${texmf}/doc/latex/belarusian-babel/
- update filename base (see documentation for your TeX system)

Usage
-----

Belarusian language definition file can be used both with legacy 8-bit engines
(such as latex or pdflatex) and Unicode compilers (xelatex or lualatex).
The Unicode engines can be ran either in Unicode mode or 8-bit
compatibility mode, which emulates the legacy engines. The two modes differ by
a set of packages loaded in the preamble of a source TeX file. It is important
to keep recommended order of the packages loaded, especially when running
Unicode engines in a compatibility 8-bit mode.

In the examples below, it is assumed that a source file has utf8 input encoding.

### 8-bit mode

#### PDFLATeX, LaTeX

    \usepackage[T1,T2A]{fontenc}
    \usepackage[utf8]{inputenc}
    \usepackage[english,belarusian]{babel}

#### LuaLaTeX

    \usepackage[T1,T2A]{fontenc}
    \usepackage[lutf8]{luainputenc}
    \usepackage[english,belarusian]{babel}

#### XeLaTeX

    \XeTeXinputencoding "bytes"
    \usepackage[utf8]{inputenc}
    \usepackage[T2A]{fontenc}
    \usepackage[english,belarusian]{babel}

### Unicode mode, LuaLaTeX or XeLaTeX

    \usepackage{fontspec}
        \defaultfontfeatures{Ligatures={TeX}}
        \setmainfont{CMU Serif}
        \setsansfont{CMU Sans Serif}
        \setmonofont{CMU Typewriter Text}
    \usepackage[english,belarusian]{babel}

Instead of the Computer Modern Unicode (CMU) fonts loaded in this example,
you may use any True Type or Open Type fonts installed on your computer.

### Using "classic" (Taraškievič) spelling

    \usepackage[english,belarusian]{babel}
    \languageattribute{belarusian}{classic}

or

    \usepackage[english,belarusian.classic]{babel}

or

    \usepackage[english,belarusian]{babel}
    \languageattribute{belarusian}{tarask}

or

    \usepackage[english,belarusian.tarask]{babel}

Documentation
-------------

See belarusian.pdf for more information.

Known problems
--------------

Before switching from a legacy 8-bit engine (tex, pdftex) to an Unicode
engine (xetex, luatex) and vise versa delete all .aux, .toc, .lot, .lof
files as they might have stored incompatible internal encodings.

Changes
-------

2018-10-09 version 1.5

  * Replace \cyrmath with \textnormal.
    Patch by Ivan Kokan.

2018-08-25 version 1.4

  * Rename belarusianb.dtx to belarusian.dtx since the patch to Babel
    has been never submitted.
  * Use textcomp package in the documentation.
  * Formatting fixes.
  * Convert the README to Markdown.
  * Rename the Unicode detection macro to fix conflicts with babel-russian.

2016-04-07 version 1.3h

  * Initial version

Original source: russianb.dtx

2016-02-18 v1.3h Russian support from the babel system.
