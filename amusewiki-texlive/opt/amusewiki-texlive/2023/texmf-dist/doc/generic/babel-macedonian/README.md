Macedonian cyrillic support for LaTeX Babel

maintainer: Stojan Trajanovski, [name].[surname]@gmail.com

This package may be distributed under the terms of the LaTeX Project Public License

1. INSTALLATION AND MODIFICATIONS

Installation:
1. Just copy the file macedonian.ldf, where (a) your .tex document is stored; or (b) in your latex distribution babel folder.

If you want to modify something:
1. compile the file: macedonian.dtx using pdfLatex
2. compile the file: macedonian.ins using pdfLatex, after completing 1. A file named: macedonian.ldf will be created
3. copy this file (macedonian.ldf), where your .tex document is stored or in your latex distribution babel folder.


2. HOW TO USE IT

You set the keyboard layout to Macedonian cyrillic, and you have to use unicode-compliant text editor. You also have to save your file in utf-8x encoding.

All you have to do, in order to use Macedonian cyrillic support for latex is typing:

\usepackage[utf8x]{inputenc}

\usepackage[macedonian]{babel}

somewhere near the beginning of your .tex file.