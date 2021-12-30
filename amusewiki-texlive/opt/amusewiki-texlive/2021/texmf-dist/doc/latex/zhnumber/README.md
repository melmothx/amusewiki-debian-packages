zhnumber
========

The `zhnumber` package provides commands to typeset Chinese representations of
numbers. The main difference between this package and `CJKnumb` is that commands
provided by this package is expandable in the proper way. So, it seems that
zhnumber is a good alternative to `CJKnumb` package.

Basic Usage
-----------
The package provides the following macros:

    \zhnumber{<number>}

Convert `<number>` to a full Chinese representation.

    \zhnum{<counter>}

Similar to `\arabic{<counter>}`, but representation of `<counter>`
as Chinese numerals.

    \zhdigits{<number>}
    \zhdigits*{<number>}

Handle `<number>` as a string of digits and convert each of them into the
corresponding Chinese digit. The starred version uses the Chinese circle glyph
for digit zero; the unstarred version uses the traditional glyph.

You can read the package manual (in Chinese) for more detailed explanations.

Contributing
------------

This package is a part of the [ctex-kit](https://github.com/CTeX-org/ctex-kit) project.

Issues and pull requests are welcome.

Copyright and Licence
---------------------

    Copyright (C) 2012, 2014-2020 by Qing Lee <sobenlee@gmail.com>
    ----------------------------------------------------------------------

    This work may be distributed and/or modified under the
    conditions of the LaTeX Project Public License, either
    version 1.3c of this license or (at your option) any later
    version. This version of this license is in
       http://www.latex-project.org/lppl/lppl-1-3c.txt
    and the latest version of this license is in
       http://www.latex-project.org/lppl.txt
    and version 1.3 or later is part of all distributions of
    LaTeX version 2005/12/01 or later.

    This work has the LPPL maintenance status "maintained".

    The Current Maintainer of this work is Qing Lee.

    This package consists of the file  zhnumber.dtx,
                 and the derived files zhnumber.pdf,
                                       zhnumber.sty,
                                       zhnumber-utf8.cfg,
                                       zhnumber-gbk.cfg,
                                       zhnumber-big5.cfg,
                                       zhnumber.ins and
                                       README.md (this file).
