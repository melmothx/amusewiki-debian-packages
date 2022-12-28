----------------------------------------------------------------

Ukrainian language module for Babel, v1.4e

Released under the LaTeX Project Public License v1.3c or later.
See http://www.latex-project.org/lppl.txt

The package provides support for use of Babel in documents written in Ukrainian. The support is adapted for use both
under legacy TEX engines, and under X∃TEX and LuaTEX.

Based on Russian language module v1.3i by Igor A. Kotelnikov <kia999 at mail dot ru>.

The current maintainer is Sergiy Ponomarenko <sergiy.ponomarenko@gmail.com>.

1. INSTALLATION

- unpack babel-ukrainian.zip
- run "lualatex.exe ukraineb.dtx" (recommended)
  or "pdflatex.exe ukraineb.dtx";
  run "tex.exe ukraineb.dtx"
  or "tex.exe ukraineb.ins", if you don't need documentation
- move "ukraineb.ldf" to <textmf>/tex/generic/babel/babel-ukrainian/
- move "ukraineb.pdf" and README to <textmf>/doc/generic/babel-ukrainian/
- update filename base (see documentation for your TeX system)

2. USAGE

Ukrainian language definition file can be used both with legacy 8-bit engines
(such as latex.exe or pdflatex.exe) and Unicode compilers (xelatex.exe or
lualatex.exe). The Unicode engines can be ran either in Unicode mode or 8-bit
compatibility mode, which emulates the legacy engines. The two modes differ by
a set of packages loaded in the preamble of a source TeX file. It is important
to keep recommended order of the packages loaded, especially when running
Unicode engines in a compatibility 8-bit mode.

In the examples below, it is assumed that a source file has utf8 input encoding.

2.1. 8-bit mode

2.1.1 PDFLATeX, LaTeX

    \usepackage[T1,T2A]{fontenc}
    \usepackage[utf8]{inputenc}
    \usepackage[english,ukrainian]{babel}

2.1.2 LuaLaTeX

    \usepackage[T1,T2A]{fontenc}
    \usepackage[lutf8]{luainputenc}
    \usepackage[english,ukrainian]{babel}

2.1.3 XeLaTeX

    \XeTeXinputencoding "bytes"
    \usepackage[utf8]{inputenc}
    \usepackage[T2A]{fontenc}
    \usepackage[english,ukrainian]{babel}

2.2 Unicode mode, LuaLaTeX or XeLaTeX

    \usepackage{fontspec}
        \defaultfontfeatures{Ligatures={TeX}}
        \setmainfont{CMU Serif}
        \setsansfont{CMU Sans Serif}
        \setmonofont{CMU Typewriter Text}
    \usepackage[english,ukrainian]{babel}

Instead of the Computer Modern Unicode (CMU) fonts loaded in this example,
you may try any True Type or Open Type font installed on your computer provided
that that font came with Ukrainian letters.

3. DOCUMENTATION

See ukraineb.pdf for more information.

4. KNOWN PROBLEMS

Before switching from a legacy 8-bit engine (tex, pdftex) to an Unicode
engine (xetex, luatex) and vise versa delete all .aux, .toc, .lot, .lof
files as they might have stored incompatible internal encodings.

5. CHANGES

2020-10-13 version 1.4e
   * Preventing a problem with duplicate math operators in russian.ldf.

2020-10-13 version 1.4d
   * Added support for pdfstings.

2018-04-11 version 1.4с
   * Fixed unprotected endlines.

2017-08-10 version 1.4b

    * Default for \cyrdash is provided.
    * TU encoding is set as default for XeTeX and LuaTeX; EU1 and EU2 encodings
      are kept for backward compatibility.

2017-06-13 version 1.4a

    * Removing \week<roman number>day macro, since it is should be define in datetime2 class
    * Removing revtex4(4-1) classes ukrainization because it unused in ukainian text typesetting
    * Adding \acronymname, \lstlistingname and \lstlistlistingname macros to nonunicode captions

2017-06-10 version 1.4

    * For compatibility with older Ukrainian packages we leave definition of the \No macro
    * Fix Ukrainian translation of babel unicode string \chaptername
    * Macros \Asbuk and \asbuk are removed
    * Cyrillic alphabetical enumeration is provided by \Alph and \alph macros when Ukrainian loaded
    * Used babel's 3.9 (and later) macros for defining caption names and date for Unicode case

2017-06-08 version 1.3i

    * Corrections according to alphabetical enumeration Ukrainian standart ДСТУ 3008:2015
    * Some math macro from original russian.ldf was removed because of seldom usage

2017-06-06 version 1.3h

    * Initial version

Original source:  russianb.dtx,
    2017-01-12 v1.3i Russian support from the babel system.

----------------------------------------------------------------
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote \"    Hash (number) \#
%%   Dollar        \$     Percent      \%    Ampersand     \&
%%   Acute accent  \'     Left paren   \(    Right paren   \)
%%   Asterisk      \*     Plus         \+    Comma         \,
%%   Minus         \-     Point        \.    Solidus       \/
%%   Colon         \:     Semicolon    \;    Less than     \<
%%   Equals        \=     Greater than \>    Question mark \?
%%   Commercial at \@     Left bracket \[    Backslash     \\
%%   Right bracket \]     Circumflex   \^    Underscore    \_
%%   Grave accent  \`     Left brace   \{    Vertical bar  \|
%%   Right brace   \}     Tilde        \~}
%%

%% Nonunicode Cyrillic Letters
%% \CYRA=А
%% \CYRB=Б
%% \CYRV=В
%% \CYRG=Г
%% \CYRGUP=Ґ
%% \CYRD=Д
%% \CYRE=Е
%% \CYRIE=Є
%% \CYRZH=Ж
%% \CYRZ=З
%% \CYRI=И
%% \CYRII=I
%% \CYRYI=Ї
%% \CYRISHRT=Й
%% \CYRK=К
%% \CYRL=Л
%% \CYRM=М
%% \CYRN=Н
%% \CYRO=О
%% \CYRP=П
%% \CYRR=Р
%% \CYRS=С
%% \CYRT=Т
%% \CYRU=У
%% \CYRF=Ф
%% \CYRH=Х
%% \CYRC=Ц
%% \CYRCH=Ч
%% \CYRSH=Ш
%% \CYRSHCH=Щ
%% \CYRYU=Ю
%% \CYRYA=Я
%% \CYRSFTSN=Ь
%%
%% \cyra=а
%% \cyrb=б
%% \cyrv=в
%% \cyrg=г
%% \cyrgup=ґ
%% \cyrd=д
%% \cyre=е
%% \cyrie=є
%% \cyrzh=ж
%% \cyrz=з
%% \cyri=и
%% \cyrii=i
%% \cyryi=ї
%% \cyrishrt=й
%% \cyrk=к
%% \cyrl=л
%% \cyrm=м
%% \cyrn=н
%% \cyro=о
%% \cyrp=п
%% \cyrr=р
%% \cyrs=с
%% \cyrt=т
%% \cyru=у
%% \cyrf=ф
%% \cyrh=х
%% \cyrc=ц
%% \cyrch=ч
%% \cyrsh=ш
%% \cyrshch=щ
%% \cyryu=ю
%% \cyrya=я
%% \cyrsftsn=ь
