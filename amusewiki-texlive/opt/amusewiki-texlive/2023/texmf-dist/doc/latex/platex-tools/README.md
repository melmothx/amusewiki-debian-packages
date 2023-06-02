# platex-tools

This bundle is an extended version of latex-tools bundle developed
by LaTeX team, mainly intended to support pLaTeX2e and upLaTeX2e.
Patches for latex-tools bundle and ms bundle (by Martin Schröder)
and some additional packages are included.

## Bundle contents

All these packages can be used on pLaTeX and upLaTeX.

- pldocverb.sty:
    Patch for doc.sty (latex) to improve
    compatibility with `\verb` redefinition in pLaTeX.
- plarray.sty:
    Patch for array.sty (latex-tools) to improve
    compatibility with pLaTeX kernel.
- plextarray.sty:
    Patch for array.sty (latex-tools) to improve
    compatibility with plext.sty in pLaTeX.
- plextdelarray.sty:
    Patch for delarray.sty (latex-tools) to improve
    compatibility with plext.sty in pLaTeX.
- plextcolortbl.sty:
    Patch for colortbl.sty (by David Carlisle) to improve
    compatibility with plext.sty in pLaTeX.
- pxftnright.sty:
    Patch for ftnright.sty (latex-tools) to support
    Japanese classes for vertical writing.
- pxmulticol.sty:
    Patch for multicol.sty (latex-tools) to support
    `\footnote` in vertical writing.
- pxxspace.sty:
    Patch for xspace.sty (latex-tools) to fix
    interword spacing with Japanese characters.
    Version 0.2 was written by Takayuki YATO in 2019
    (https://gist.github.com/zr-tex8r/7de76036846e149bc28ec6399a683e3a),
    and incorporated into this bundle by his courtesy.
- pxeverysel.sty:
    Patch for everysel.sty (ms) to improve
    compatibility with Japanese font selection in pLaTeX.
    Version 0.1 was written by Takayuki YATO in 2015
    (https://gist.github.com/zr-tex8r/48c6910bbbe2f41d72de),
    and incorporated into this bundle by his courtesy.
- pxeveryshi.sty:
    Patch for everyshi.sty (ms) to support
    Japanese classes for vertical writing.
    Version 0.1 was written by Takayuki YATO in 2012
    (https://gist.github.com/zr-tex8r/2702969),
    and incorporated into this bundle by his courtesy.
- pxatbegshi.sty:
    Patch for atbegshi.sty (oberdiek) to support
    Japanese classes for vertical writing.
    The essential part of this package was proposed by
    Hironori Kitagawa in 2017.

The packages "gentombow" (formerly "pxgentombow") and "bounddvi"
are now distributed as part of
[gentombow](https://github.com/aminophen/gentombow) bundle.

## Character encoding

All the package files (.sty) contain ASCII characters only.
All the document files (.tex) are encoded in UTF-8.

## Installation

- *.sty -> $TEXMF/tex/platex/platex-tools
- *.tex, *.pdf -> $TEXMF/doc/platex/platex-tools

## Repository

The bundle is maintained on GitHub:
  https://github.com/aminophen/platex-tools

You can also obtain this bundle from CTAN:
  https://www.ctan.org/pkg/platex-tools

## License

The bundle may be distributed and/or modified under the terms of
the 3-clause BSD license (see [LICENSE](./LICENSE)).

## Release Date

2023-02-26

Hironobu Yamashita
