=========================================================================
The babel-estonian bundle

Estonian language support for the babel multilingual package

Authors: Enn Saar, Jaan Vajakas

Current Maintainer: Jaan Vajakas
E-mail: jaanvajakas (at) hot (dot) ee

Released under the LaTeX Project Public License v1.3 or later
See http://www.latex-project.org/lppl.txt
=========================================================================

== PURPOSE ==

This bundle is an extension to the babel package for multilingual
typesetting. It provides all necessary macros, definitions and settings
to typeset Estonian documents.


== CONTENTS ==

The bundle consists of the following files:

* estonian.ins (installation file to unpack the language definition
  file estonian.ldf)
* estonian.dtx (packed language definition file and documentation)
* estonian.pdf (unpacked documentation for estonian.ldf)
* README.txt (this file)


== INSTALLATION ==

If the latest version of this package is not included in your LaTeX
distribution, do the following:

* issue "latex estonian.ins" to unpack the language definition file
* copy the file estonian.ldf to a location where TeX can find it
  (default location: $TEXMF/tex/generic/babel-estonian/)

To re-generate the manual, issue
  latex estonian.dtx
  makeindex -s gglo.ist -o estonian.gls estonian.glo
  latex estonian.dtx
  latex estonian.dtx
  dvips estonian.dvi
  ps2pdf estonian.ps


== DOCUMENTATION ==

See the included manual estonian.pdf for usage instructions.


== CHANGES ==

See the included manual estonian.pdf, section "Change History".
