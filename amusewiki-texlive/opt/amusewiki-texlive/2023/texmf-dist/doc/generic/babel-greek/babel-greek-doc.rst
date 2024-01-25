babel-greek
***********
Babel support for the Greek language and script
===============================================

:Version: 1.15 (changelog_)

:Copyright: © 1997 Apostolos Syropoulos, Claudio Beccari, Johannes Brahms,
            © 2013 -- 2023 Günter Milde.
:Licence:   This work may be distributed and/or modified under the
            conditions of the `LaTeX Project Public License`_, either
            version 1.3 of this license or any later version.

:Home:      https://codeberg.org/milde/greek-tex

:Latest Release: https://ctan.org/pkg/babel-greek

:Abstract:  `babel-greek` is a contributed package providing comprehensive
            support for the Greek language and script via the Babel_ system.
            Document authors can select between the *monotonic*
            (single-diacritic), *polytonic* (multiple-diacritic), and
            *ancient* orthography of the Greek language.

.. contents::

Files
-----

`<athnum.dtx>`_
  Athenian (Attic, Herodianic, or acrophonic) Numerals. [`<athnum.pdf>`_]
`<babel-greek.dtx>`_
  Source of the language definition file ``greek.ldf`` for use with Babel_.
  [`<babel-greek.pdf>`_]
`<babel-greek.ins>`_
  DocStrip_ batch file.
`<grmath.dtx>`_
  Greek log-like Operators. [`<grmath.pdf>`_]
test-\*.tex
  Documented test samples.
  [`<test-greek.pdf>`_, `<test-greeknum.pdf>`_, `<test-athnum.pdf>`_]
`<usage.tex>`_
  Description of the `LGR Latin transliteration`_ and the `Greek numerals`_.
  [`<usage.pdf>`_]


Requirements
------------

The `babel-greek` package requires the Babel_ package and font
definition files from the greek-fontenc_ package. The greek-inputenc_
package is recommended when using 8-bit TeX engines.

Typesetting Greek texts requires `Greek text fonts`_.

Plain TeX is currently not supported. Patches are welcome.


Download and Installation
-------------------------

The simplest way is to get and install this package from your
distribution using its installation manager.

Alternatively:

* Download the latest `release`_ from the package's `CTAN page`_ or a
  snapshot_ of the `greek-tex`_ repository.

* Unpack the source archive to a temporary location.

* From the ``babel-greek`` directory,
  run ``tex`` or ``latex`` on the batch file ``babel-greek.ins``.

  This will generate the files ``greek.ldf``, ``athnum.sty``, and
  ``grmath.sty`` in the current directory.

* Move all files ending in ``.ldf`` or ``.sty`` into a directory
  in the TeX search path.

* To produce the documentation, run the file ``usage.tex`` and all files
  ending in ``.dtx`` through LaTeX.

The last steps can be automated using the Unix `make`_ tool.
The repository sources include a `Makefile`_ defining the targets

:``all``:            (re)build packages, documentation, and tests,
:``packages``:       (re)build the packages,
:``doc``:            (re)generate HTML and PDF documentation files,
:``test``:           run LaTeX on the test documents,
:``update``:         copy packages into a local TeX tree, [#update]_
:``update-package``: copy documentation and sources into a local
                     TeX tree, [#update]_
:``clean``:          delete auxiliary files.

.. [#update] This is a simple ``cp --update`` to a pre-set path.
   The destination directory must exist. Files no longer present in the
   package are not removed.

.. _release:
    https://mirrors.ctan.org/macros/latex/contrib/babel-contrib/greek.zip
.. _CTAN page: https://www.ctan.org/pkg/babel-greek
.. _greek-tex: https://codeberg.org/milde/greek-tex/
.. _snapshot: https://codeberg.org/milde/greek-tex/archive/master.zip
.. _make: https://en.wikipedia.org/wiki/Make_(software)
.. _Makefile: https://codeberg.org/milde/greek-tex/src/branch/master/babel-greek/Makefile


Usage
-----

.. role:: latex(code)

To **load Greek language support** with Babel, use the ``greek``
document option or pass the ``greek`` option to Babel. For example,

.. code:: latex

  \usepackage[greek,english]{babel}

activates support for Greek text parts in an English document. [#]_

For ancient Greek, set the language attribute  "ancient", either
after loading Babel

.. code:: latex

  \usepackage[greek,english]{babel}
  \languageattribute{greek}{ancient}

or as modifier

.. code:: latex

  \usepackage[greek.ancient,english]{babel}

Similarly, the attribute "polutoniko" selects the modern polytonic Greek
language variant,

.. code:: latex

  \usepackage[greek.polutoniko,english]{babel}

The Babel_ core provides two commands to **select the active language**:

* The declaration ``\selectlanguage{greek}`` switches to the Greek
  language,

* the function ``\foreignlanguage{greek}{<some text>}`` sets
  its second argument in Greek.

Both ensure support for the Greek script and select Greek
case-changing and hyphenation rules.
For details see the Babel_ documentation and babel-greek.pdf_.

Input of Greek characters is possible

* as literal characters (α ... Ω) [#]_,
* as LICR macro (``\textalpha{} ... \textOmega``),
* or via the `LGR Latin transliteration`_ (a ... W) [#]_.

For details and caveats, see test-greek.pdf_ and the example files
provided with greek-fontenc_.

.. [#] The *last* language option sets the document's main language.
.. [#] with the greek-inputenc_ package or XeTeX/LuaTeX
.. [#] only with 8-bit LGR_ fonts


Greek text fonts
----------------

A list of `Greek text fonts for use with LaTeX`_ is available at CTAN.

The non-standard **LGR** `font encoding`_ is used for typesetting Greek with
"traditional" **8-bit TeX** engines (pdfTeX). Fonts in this encoding include
the `CB fonts`_ (matching CM), grtimes_ (Greek Times), Kerkis_ (matching
URW Bookman), and the `GFS font collection`_.
The package `cbfonts-fd`_ registers the CB fonts as Greek substitute for
the Computer Modern and Latin Modern font families.  For other font
families, declaring Greek fonts as supplement for matching Latin font
families can be done with the :latex:`\DeclareFontFamilySubstitution`
macro (see section `Providing font family substitutions` in [fntguide]_).

**Unicode fonts** used with **XeTeX** or **LuaTeX** provide slots for all
Unicode characters in one font but commonly only a subset of the actual
glyphs.

.. Warning::
     The default **Latin Modern** Unicode font
     **contains only a few Greek letters!**
     Unsupported characters are silently dropped from the output.
     Warnings about missing glyphs are written to the log file
     but not to the console.

Select a suitable font with Babel_'s font selecting framework or fontspec_.
Examples for suitable fonts are CM-unicode_ or `Linux Libertine`_ as well
as any system-wide installed OTF font that supports Greek (e.g. `Deja Vu`_).
See, e.g., the list of free `fonts supporting Greek script`_ by
openSUSE's fontinfo.

.. _Greek text fonts for use with LaTeX: https://ctan.org/topic/font-greek
.. _fonts supporting Greek script:
    https://fontinfo.opensuse.org/scripts/script-Greek.html


LGR Latin Transliteration
-------------------------

The LGR font encoding allows input of Greek characters via a Latin
transliteration. This enables simple input with a Latin keyboard. Characters
with diacritics may be selected with accent macros (cf. greek-fontenc_) or
via the ligature definitions in the font (see usage.pdf_).

The following ASCII characters are converted to Greek symbols:

= = = = = = = = = = = = = = = = = = = = = = = = =
A B G D E Z H J I K L M N X O P R S   T U F Q Y W
Α Β Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ   Τ Υ Φ Χ Ψ Ω
a b g d e z h j i k l m n x o p r s c t u f q y w
α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ σ ς τ υ φ χ ψ ω
= = = = = = = = = = = = = = = = = = = = = = = = =

Accent symbols and punctuation:

================ ======= ==  ====================== ======= ==
tonos/oxia       ``'a``  ά   right apostrophe       ``''``  ’
varia            ```a``  ὰ   left apostrophe        \`\`    ‘
dasia            ``<a``  ἁ   left quotation mark    ``((``  «
psili            ``>a``  ἀ   right quotation mark   ``))``  »
perispomeni [#]_ ``\~a`` ᾶ   erotimatiko            ``?``   ;
dialytika        ``"i``  ϊ   ano teleia [#]_        ``;``   ·
ypogegrammeni    ``a|``  ᾳ   zero width non-joiner  ``av|`` αͺ
================ ======= ==  ====================== ======= ==

The downside is, that you cannot print Latin letters and some symbols if
LGR is the active font encoding. This means that for every Latin-written
word or acronym in a Greek text part, an explicit font encoding switch is
required.

.. [#] The tilde can be used without backslash in the language variants
   "ancient" and "polutoniko". In monotonic Greek, it keeps its default
   expansion to a no-break space.

.. [#] The "_`keep-semicolon`" language attribute prevents the mapping of
   a semicolon to a middle dot to allow its use as Greek question mark
   (erotimatiko).


Greek Numerals
--------------

`babel-greek` provides the macros :latex:`\greeknumeral` and
:latex:`\Greeknumeral` to transform a number into its corresponding
`Greek numeral <https://en.wikipedia.org/wiki/Greek_numerals>`__
(see also section `Greek numbering`__ in the PDF documentation).

__ http://mirrors.ctan.org/macros/latex/contrib/babel-contrib/
    greek/babel-greek.pdf#greek-numbering


The classic `Greek numerals`, also known as Ionic, Ionian, Milesian, or
Alexandrian numerals were introduced to Athens along with the Ionic alphabet
from the city of Miletus in Ionia replacing the `Attic numerals`_.
They are still used in everyday life for ordinal numbers and
more generally by the Orthodox church and certain scholars.

Greek numerals use several now obsolete letters:
digamma_ ϝ or stigma_ ϛ, koppa_ ϟ or ϙ, and sampi_ ϡ
[Nicholas-05]_ [Haralambous-98]_.

* Standing for 6 is the digamma_ ϝ, the sixth letter of the Ionic
  alphabet (just as its Latin equivalent F is the sixth letter of the
  Latin alphabet). As Greek script turned to uncial and then lowercase,
  the numeral changed its shape and became conflated with another,
  similar sign: the ligature for sigma-tau stigma_ ϛ.
  The letters στ are frequently used as replacement.

  There is no significant tradition of ϝ being used as a numeral in
  editions of classical texts, even though the Ancients clearly used
  digamma rather than stigma as their numeral.

* Three different signs are in use for the number 90: Classicists use the
  "archaic koppa_" ϙ, and more rarely its uncial form (resembling the
  "`Cyrillic letter koppa`_" ҁ or the "Gothic letter ninety" 𐍁).
  Modern Greeks use the "Greek letter koppa" ϟ exclusively and
  do not recognise ϙ at all, let alone as a glyph variant of ϟ.

* The sign for the number 900 is the sampi_ ϡ. Its shape, developed
  during its use in minuscule handwriting of the Byzantine era.  Earlier
  variants similar to the "archaic sampi" ͳ and the "Gothic Letter Nine
  Hundred" 𐍊 are not used in Greek.

Users can redefine the macros :latex:`\greeknumeralsix`,
:latex:`\greeknumeralSix`, :latex:`\greeknumeralninety`, and
:latex:`\greeknumeralNinety` to configure the used symbols,
for example

.. code:: latex

  \renewcommand{\greeknumeralninety}{\textkoppa}
  \renewcommand{\greeknumeralNinety}{\textKoppa}
  \ifdefined \textvarstigma
    \renewcommand{\greeknumeralSix}{\textvarstigma}
  \fi

sets the symbol for 90 to the "modern" koppa ϟ also for ancient Greek
and the "capital" 6 symbol to the variant stigma glyph (only defined in LGR).

.. _digamma: https://en.wikipedia.org/wiki/Digamma
.. _stigma: https://en.wikipedia.org/wiki/Stigma_(ligature)
.. _koppa: https://en.wikipedia.org/wiki/Koppa_(letter)
.. _Cyrillic letter koppa: https://en.wikipedia.org/wiki/Koppa_(Cyrillic)
.. _sampi: https://en.wikipedia.org/wiki/Sampi
.. _Attic numerals: https://en.wikipedia.org/wiki/Attic_numerals


Changelog
---------

1.4  (2013-05-17)
     - New maintainer.
     - The encoding definition file ``lgrenc.def`` moved to the
       greek-fontenc_ package.
1.5  (2013-06-21)
     - Bugfixes and cleanup.
     - LICR macros in string definitions.
     - LGR font encoding not used with XeTeX/LuaTeX.
     - Input "xgreek-fixes.def" from polyglossia_ with Xe/LuaTeX.
1.5a (2013-07-02)
     - Fix LaTeX bugs babel/3707, `babel/4303`_ and `babel/4305`_
1.6  (2013-07-19)
     - Experimental support for XeTeX/LuaTeX.
1.7  (2013-09-09)
     - CB-Fonts font definition files moved to CB-Fonts package.
     - Do not auto-load euenc.def with XeTeX/LuaTeX.
1.7a (2013-09-13)
     - Fix bug `babel/4360`_: spurious ``\fi``.
1.7b (2013-10-01)
     - Fix upcasing of babel strings with Xe/LuaTeX.
1.8  (2013-12-02)
     - Rename ``greek.dtx`` to ``babel-greek`` so that texdoc_
       shows the right documentation.
     - Compatibility with Xe/LuaTeX in Unicode and 8-bit mode.
1.8a (2013-12-03)
     - Set ``\encodingdefault`` in ``\greekscript`` to fix Greek
       in footnotes etc. with document language Greek.
1.9  (2014-07-20)
     - New attribute for ancient Greek, load correct hyphenation
       patterns (patch by Claudio Beccari).
     - Bugfix for ``\Makeuppercase``
1.9a (2014-09-12)
     - Remove duplicate code, documentation review.
1.9b (2014-09-18)
     - Remove spurious whitespace from ``\extrasgreek`` definition.
     - Use named macros instead of non-standard short macros
       for *psili* and *dasia* in the string definitions.
1.9c (2014-10-21)
     - Fix dummy hyphenation language names (patch by Ulrike Fischer).
1.9d (2015-09-04)
     - Remove `grsymb` (macros for Greek symbols).
       This package is outdated and obsoleted by greek-fontenc_
       (reported by Claudio Beccari).
     - Unicode uc/lc corrections now in `greek-fontenc`.
1.9e (2015-11-27)
     - Fix bug in lccode-setting loop (patch by Enrico Gregorio).
1.9f (2016-02-04)
     - Support for new standard Unicode text font encoding "TU".
1.9g (2016-09-07)
     - Babel 3.9i deprecated ``\textlatin`` and fixed ``\latinencoding``.
       1.9h (2019-07-11)
     - Move breathing composite commands to textalpha_.
1.9i (2020-02-28)
     - Update test for Unicode fonts.
     - Fix accent in ``\seename`` and ``\alsoname``.
1.9j (2020-03-17)
     - Fix ampersand in math mode.
1.10 (2020-11-10)
     - Use ``TU`` as ``\greekfontencoding`` for Xe/LuaTeX (set by LaTeX as
       `default font encoding for Unicode engines`_ since 2017/01/01).
     - Use zig-zaggy ``\textkoppa`` for ``\greeknumeral{90}``.
     - PDF-string secure implementation of ``\greeknumeral`` from hyperref_.
     - Load ``puenc-greek.def`` (from greek-fontenc_) if used with hyperref
       (polytonic Greek in PDF-strings).
1.11 (2020-11-20)
     - Configurable `Greek numerals`_ 6 and 90.
     - Save/restore previous font encoding instead of switching
       to hard-coded ``\latinencoding`` when leaving Greek.
1.12 (2023-03-04)
     - Do not change the uccode values if the LaTeX version is newer than
       2022/06. The new ``\MakeUppercase`` definition ignores them and fails
       with the "dummy" character 0x9f (cf. [ltnews35]_, `LaTeX issue 987`_).
     - New modifiers ``local-LGR-fixes`` and ``no-LGR-fixes`` to address
       indexing problmes with Roman numerals (`Babel issue 170`_). Provisional.
     - New TextCommand ``\EnsureStandardFontEncoding``.
     - Rename ``\textgreek`` to ``\lgrfont`` to avoid confusion with a
       language changing command.
     - Documentation update and refactoring.
     - Drop LGR-local re-definition of ``\SS``.
     - `athnum.dtx`_ 2.0:
       Don't require Babel.
       Use LICR macros instead of the Latin transliteration.
1.13 (2023-03-15)
     - New language attribute "keep-semicolon_".
     - Rename ``\greek@tilde`` to ``\bbl@greek@tilde``, simplify definition.
     - Fix links, update documentation.
1.13.1 (2023-03-17)
     - Don't use text command in math mode with "keep-semicolon".
     - `athnum.dtx`_ 2.0.1: Fix behaviour in math mode.
1.13.2 (2023-06-01)
     - Warn of unsupported (or misspelled) "modifiers"
       (code contributed by Javier Bezos).
     - Fix upcasing of text using the `LGR Latin transliteration`_:
       drop accents with ``\DeclareUppercaseMapping`` (`new in LaTeX 2023`_).
1.14 (2023-08-18)
     - Fix upcasing of Greek letters with standard accent macros.
     - New modifier `local-MakeUppercase-fixes`.
1.15 (2023-10-13)
     - Switch to the previous ``\encodingdefault`` (not ``\cf@encoding``)
       when exiting Greek text parts.
       Exception: use ``\latinencoding`` if the initial ``\encodingdefault``
       is LGR and "greek" is the main document language.
     - Fix standard accent macros also with pre-2022 ``\MakeUppercase``.
     - Rename modifier `local-MakeUppercase-fixes` to
       `no-MakeUppercase-fixes`.


.. _babel/4303: http://www.latex-project.org/cgi-bin/ltxbugs2html?pr=babel/4303
.. _babel/4305: http://www.latex-project.org/cgi-bin/ltxbugs2html?pr=babel/4305
.. _babel/4360: http://www.latex-project.org/cgi-bin/ltxbugs2html?pr=babel/4360
.. _Babel issue 170: https://github.com/latex3/babel/issues/170
.. _LaTeX issue 987: https://github.com/latex3/latex2e/issues/987
.. _default font encoding for Unicode engines:
    https://www.latex-project.org/news/latex2e-news/ltnews26.pdf
.. _new in LaTeX 2023:
    https://www.latex-project.org/news/latex2e-news/ltnews37.pdf


References
----------

.. [fntguide] LaTeX Project Team `LaTeX2e font selection`, December 2021.
   https://www.latex-project.org/help/documentation/fntguide.pdf
.. [ltnews35] LaTeX Project Team `LaTeX News 35`, June 2022.
   https://www.latex-project.org/news/latex2e-news/ltnews35.pdf
.. [Nicholas-05] Nick Nicholas `Numerals: Stigma, Koppa, Sampi`, 2005.
   https://opoudjis.net/unicode/numerals.html
.. [Vlachou-22] Irene Vlachou
   `Polytonic Greek: a guide for type designers`, 2022.
   https://irenevl.github.io/Polytonic-tutorial/
.. [Haralambous-98] Yannis Haralambous
   `From Unicode to Typography, a Case Study: the Greek Script`, 1998.
   https://hal.science/hal-02101618

.. _LaTeX Project Public License: http://www.latex-project.org/lppl.txt
.. _babel: https://ctan.org/pkg/babel
.. _docstrip: https://ctan.org/pkg/docstrip
.. _font encoding: https://mirrors.ctan.org/macros/latex/base/encguide.pdf
.. _fontspec: https://ctan.org/pkg/fontspec
.. _fontenc: https://ctan.org/pkg/fontenc
.. _CB Fonts: https://ctan.org/pkg/cbgreek-complete
.. _cbfonts-fd: https://ctan.org/pkg/cbfonts-fd
.. _CM-unicode: https://ctan.org/pkg/cm-unicode
.. _Deja Vu: http://dejavu-fonts.org
.. _e-TeX: http://www.tex.ac.uk/cgi-bin/texfaq2html?label=etex
.. _grtimes: https://ctan.org/pkg/grtimes
.. _hyperref: https://ctan.org/pkg/hyperref
.. _textalpha: http://mirrors.ctan.org/language/greek/greek-fontenc/textalpha-doc.pdf
.. _greek-fontenc: https://ctan.org/pkg/greek-fontenc
.. _LGR: http://mirrors.ctan.org/language/greek/greek-fontenc/greek-fontenc-doc.html#lgr
.. _greek-inputenc: https://ctan.org/pkg/greek-inputenc
.. _GFS font collection: https://ctan.org/pkg/gfs
.. _Kerkis: https://ctan.org/pkg/kerkis
.. _Linux Libertine: https://ctan.org/pkg/libertine
.. _polyglossia: https://ctan.org/pkg/polyglossia
.. _substitutefont: https://ctan.org/pkg/substitutefont
.. _texdoc: https://ctan.org/pkg/texdoc
