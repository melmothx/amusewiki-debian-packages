The babel-french package (formerly known as `frenchb')
======================================================

Bundle Release date: 2025-08-15
-------------------------------

Description
-----------

This package provides support for the French language for the babel
multilingual system.

The package is now split into two parts: file frenchb3.dtx for pdfTeX
and XeTeX engines and file frenchb.dtx for LuaTeX only.
Plain and LaTeX formats are supported; for the end-user nothing changes:
\usepackage[french]{babel}
automatically loads either french.ldf if the file is compiled with LuaTeX,
or french3.ldf if the file is compiled with pdfTeX or XeTeX.

Please be aware that frenchb3.dtx is frozen (except eventually for bug
corrections), further development will be restricted to frenchb.dtx (LuaTeX).
For new documents, consider switching to LuaTeX as recommended by the
LaTeX Team (see ltnews40.pdf).

## Contents

The bundle consists of the following files:

* frenchb.dtx, frenchb3.dtx: source files with documentation in English,
* frenchb.pdf, frenchb3.pdf: unpacked documentation in English,
* frenchb-doc.pdf and frenchb3-doc.pdf: comprehensive documentation in French,
* frenchb-doc.tex, frenchb-doc3.tex: source files of frenchb-doc.pdf
  and frenchb-doc.pdf
* README.md (this file).

License
-------

Released under the LaTeX Project Public License v1.3c or later
See http://www.latex-project.org/lppl.txt

## Installation

If the latest version of this package is not included in your LaTeX
distribution, you can do the following:

* execute the commands "luatex frenchb.dtx" and "luatex frenchb3.dtx"
  in a terminal to unpack the language definition files;
* move the files frenchb.lua, french.ldf, french3.ldf, frenchb.ldf,
  francais.ldf, acadian.ldf and canadien.ldf to a location where
  TeX can find them (default location: $TEXMF/tex/generic/babel-french/);
* files frenchb.pdf, frenchb3.pdf, frenchb-doc.pdf and frenchb3-doc.pdf
  are documentation (default location: $TEXMF/doc/generic/babel-french/);
* rebuild the database (mktexlsr or so).

Documentation
-------------

See the included manuals for usage instructions: frenchb.pdf in English or
the French documentation frenchb-doc.pdf (LuaTex only) or frenchb3.pdf in
English or frenchb3-doc.pdf in French (pdfTex and XeTex).

Changes
-------

See the included manuals in English frenchb.pdf (LuaTex) and frenchb3.pdf
(pdfTex and XeTex), section "Change History".

---
Copyright 1996--2025 Daniel Flipo
E-mail: daniel (dot) flipo (at) free (dot) fr
