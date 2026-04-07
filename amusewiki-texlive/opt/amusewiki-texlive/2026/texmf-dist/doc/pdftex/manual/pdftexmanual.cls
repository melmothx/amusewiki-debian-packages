% $Id: pdftexmanual.cls 979 2026-02-16 15:32:58Z karl $
% LaTeX class file for the pdfTeX manual.
% Originally written by Karl Berry, 2023. Public domain.

\LoadClass[11pt]{report}     % use {report} so we can have \appendix
\usepackage[T1]{fontenc}     % for \textbackslash
\usepackage{fullpage}        % fewer pages is better
\usepackage{rerunfilecheck}  % so the Makefile can easily rerun
\usepackage{mflogo,graphicx} % basics
\usepackage{verbatim}        % for \verbatiminput
\usepackage{bm}              % bold math symbol

\pdfminorversion=3      % maximally compatible
\pdfobjcompresslevel=0  % since minor version=3, can't compress objects
\hbadness=10000         % don't care
\overfullrule=1mm       % but want to see overfull

\raggedbottom                  % no need for spacey pages

\divide\abovecaptionskip by 2  % too spacey by default
\setcounter{topnumber}{3}      % .ini figures are small

% This is the default hsize for letter; not ideal, but works well enough
% for a4. Too irritating to rewrite to avoid overfull hboxes with two
% different widths.
\AtBeginDocument{\hsize=469.75502pt }

% If |microtype| is loaded, deactivate it in verbatim blocks.
% It often manipulates a leading |\| in CM rather too much,
% thus messing with the visible fixed-width alignment.
%    \begin{macrocode}
\AtBeginDocument{%
   \@ifpackageloaded{microtype}
     {\g@addto@macro\@verbatim{\microtypesetup{activate=false}}}{}
}

% We want a verbatim command that will accept all special characters (so
% \texttt doesn't work) and work in arguments (so \verb doesn't work).
% 
% - can't use obeyspaces, it generates extra space.
%\PassOptionsToPackage{obeyspaces}{url}
%
% - can't use \HyOrg@url (\url saved by hyperref), it doesn't obey spaces.
% But we have to live with it, switching all args with spaces to \verb.
\usepackage[allowmove]{url} % we only do simple stuff in \caption, let it work
\def\type{\HyOrg@url}
% / in our document is PostScript, not a url, so we want to allow a
% break before, not after. But then we get an infloop, so disallow breaks.
%\g@addto@macro\UrlSpecials{\do\/{\slash}}
\g@addto@macro\UrlNoBreaks{\do\/}
%
% - can't use \nolinkurl from hyperref, doesn't obey spaces, breaks after /,
% sometimes expands, e.g., \pdfcreationdate.
% https://github.com/latex3/hyperref/issues/291
%\def\type{\nolinkurl}
%
% - can't use \lstinline, doesn't work in tables.
%\usepackage{listings}\def\type{\lstinline}
%
% - expl3 attempt:
% \NewDocumentCommand\type{v}{\texttt{#1}}
% but gets error, so I guess I don't understand:
%   LaTeX cmd Error: Verbatim-like command '\type' illegal in arg
%   \pdftexprimitive{\Syntax{\Tex{\pdfoutput}
%
% It seems the general problem remains unsolved in LaTeX.

\usepackage[pdfa,hidelinks,linktoc=all]{hyperref}

%  Assorted convenience macros.
% 
% we can use \textbackslash since we load [T1].
\DeclareRobustCommand{\cs}[1]{\mbox{\tt \textbackslash #1}}%
\DeclareRobustCommand{\titleref}[1]{{\slshape\frenchspacing#1\/}}

\def\eTeX{{$\varepsilon$}-\kern-.125em\TeX}
\def\filename{\type}
\def\hyph{-\penalty0 \hskip0pt \relax} % allow hyphenation after a -
\def\varname{\textit}
%
\def\ConTeXt{C\kern-.0333emon\-\kern-.0667em\TeX\kern-.0333emt}
\def\MDFIVE{MD5} % not oldstyle 5, capital MD
\def\PDFReference{PDF reference manual}
\def\THANH{H\`an Th\^e\llap{\raise 0.5ex\hbox{\'{}}} Th\`anh}
%
\def\eg{e.g.,}\def\Eg{E.g.,}
\def\ie{i.e.,}\def\Ie{I.e.,}
%
% the default \verbatiminput evidently ends with a blank line.
% Also, it does not give an error when the input file does not exist,
% only a terminal message. Let's complain.
\def\myverbatiminput#1{\begingroup
  \small
  \openin0 = #1
  \ifeof0 \errmessage{No verbatiminput file #1}\else\closein0 \fi
  \verbatiminput{#1}%
  \vspace{-\baselineskip}%
\endgroup}
%
\newenvironment{smalltable}{\medskip\small}{\medskip}

%  Our self-identified version information.
%
\def\svnscan $#1 #2 #3 #4-#5-#6 #7${
  \def\rcsrevision{#3}
  \def\rcsyear{#4}
  \def\rcsmonth{#5}
  \def\rcsday{{\count0=#6\relax\the\count0}}
  \def\rcsmonthname{\ifcase\rcsmonth ERROR\or
    January\or February\or March\or April\or May\or June\or July\or
    August\or September\or October\or November\or December\else ERROR\fi}
}
\def\versplit#1#2#3{#1.#2#3}% 140 -> 1.40
\def\currentpdftex{\expandafter\versplit\the\pdftexversion.\pdftexrevision}

%  Syntax descriptions.
%
% used in main source text to mark a primitive.
\def\pdftexprimitive{\par\nobreak\vspace{-4pt}\noindent\strut}

\def\aftersyntax{\nobreak\smallskip} % changed for appendix
\def\Syntax   #1{{\ignorespaces #1\unskip\strut}\par\aftersyntax}
\def\IndentSyn  {\hbox to 4.5em{}} % unchangeable space that doesn't disappear
\def\Next       {\nobreak\newline\IndentSyn\nobreak} % multiline syntax
\def\Sugar      {}
\def\Lbrace     {\Sugar{\allowbreak\texttt{\textbraceleft}}}
\def\Literal  #1{\Sugar{\type{#1}}}
\def\Means      {\Sugar{\ensuremath{\rightarrow}\;\;}}
\def\Modelist #1{\Sugar{\;{(\hbox{#1})}}}
\def\Optional #1{\Sugar{\ensuremath{\>\bm[\>\hbox{\ignorespaces #1}\>\bm]\>}}}
\def\Or         {\Sugar{\,\ensuremath{\bm{\vert}}\,\nobreak\ }}
\def\Something#1{\Sugar{\ensuremath{\langle}\textrm{#1}\ensuremath{\rangle}}}
\def\Somethingbf#1{\textbf{\Something{#1}}}
\def\Rbrace     {\Sugar{\texttt{\textbraceright}}}
\def\Whatever #1{\Sugar{\;\;\ensuremath{(\hbox{#1})}}} % parens
                       % more space before for more separation on syntax lines.

% parens with a little extra space for list of alternatives:
\def\OneOf#1{\Sugar{%
  \;\ensuremath{\bm(}%
  \;\hbox{\ignorespaces #1\unskip}\;%
  \ensuremath{\bm)}\;%
}}

% Just for clarity.
\let\InlineSyntax\relax

% introduced:
\def\introduced#1{The primitive was introduced in \PDFTEX\ #1.}
\def\introducedplural#1{The primitives were introduced in \PDFTEX\ #1.}

%  Urls.
%
% assume all defined url control sequences start with "url":
\def\useurl#1{\expandafter\csname url#1\endcsname}

\urldef{\urlctansystems}  \url{https://ctan.org/tex-archive/systems}
\urldef{\urletexctan}	  \url{https://ctan.org/pkg/etex}
\urldef{\urljbigenc}      \url{https://github.com/agl/jbig2enc}
\urldef{\urlkpathsea}	  \url{https://tug.org/kpathsea}
\urldef{\urlluatex}	  \url{https://ctan.org/pkg/luatex}
\urldef{\urlpdfreference} \url{https://pdfa.org/resource/pdf-specification-index/}
\urldef{\urlptexctan}	  \url{https://ctan.org/pkg/pdftex}
\urldef{\urlptexdevel}	  \url{svn://tug.org/pdftex/branches/stable}
\urldef{\urlptexbugs}     \url{https://lists.tug.org/pdftex}
\urldef{\urlptexorg}	  \url{https://www.pdftex.org}
\urldef{\urltcxfiles}	  \url{https://tug.org/texinfohtml/web2c.html#TCX-files}
\urldef{\urltexlive}	  \url{https://tug.org/texlive}
\urldef{\urlthanhtruetypetub} \url{https://tug.org/TUGboat/tb30-1/tb94thanh.pdf}
\urldef{\urltughelp}	  \url{https://tug.org/begin}
\urldef{\urlwebc}	  \url{https://tug.org/web2c}
\urldef{\urlxetex}	  \url{https://tug.org/xetex}
\urldef{\urlwindows}	  \url{http://ctan.org/tex-archive/systems/windows}

%  Abbreviations.
\newtoks\abbrevtoks
\def\abbrevlist{{%
  \par\bigskip
  \small
  \advance\baselineskip by 2pt plus1pt minus1pt
  \halign{&##\qquad\hfil\cr\the\abbrevtoks}%
}}
\def\abbrevitem#1#2{#1&#2\cr}
\def\abbreviation[#1] #2 #3{%
  \expandafter\def\csname#1\endcsname{#2}%
  \abbrevtoks = \expandafter{\the\abbrevtoks \abbrevitem{#2}{#3}}
}

\abbreviation [AFM]        {AFM}        {Adobe Font Metrics}
\abbreviation [ASCII]      {ASCII}      {American Standard Code for Information Interchange}
\abbreviation [CONTEXT]    {\ConTeXt}   {general purpose macro package}
\abbreviation [CTAN]       {CTAN}       {global \TEX\ archive server}
\abbreviation [DVI]        {DVI}        {native \TEX\ DeVice Independent file format}
\abbreviation [ENCTEX]     {enc\TeX}    {enc\TeX\ extension to \TEX}
\abbreviation [EPSTOPDF]   {epstopdf}   {\EPS\ to \PDF\ conversion tool}
\abbreviation [EPS]        {EPS}        {Encapsulated PostScript}
\abbreviation [EPLAIN]     {Eplain}     {Expanded plain \TEX\ format}
\abbreviation [ETEX]       {\eTeX}      {a stable extension to \TEX}
\abbreviation [EXIF]       {EXIF}       {Exchangeable Image File format (JPEG file variant)}
\abbreviation [GHOSTSCRIPT] {Ghostscript} {\POSTSCRIPT\ and \PDF\ language interpreter}
\abbreviation [GNU]        {GNU}        {GNU's Not Unix}
\abbreviation [HZ]         {HZ}         {Hermann Zapf's paragraph-breaking optimizations}
\abbreviation [ISO]        {ISO}        {International Organization for Standardization}
\abbreviation [JBIGTWO]    {JBIG2}      {Joint Bi-level Image Experts Group image format, version 2}
\abbreviation [JBIG]       {JBIG}       {Joint Bi-level Image Experts Group image format}
\abbreviation [JFIF]       {JFIF}       {JPEG File Interchange Format}
\abbreviation [JPEG]       {JPEG}       {Joint Photographic Experts Group}
\abbreviation [LATEX]      {\LaTeX}     {general-purpose macro package}
\abbreviation [LMTX]       {LMTX}       {the LuaMeta\TeX\ engine}
\abbreviation [LUATEX]     {Lua\TeX}    {the Lua\TeX\ engine}
\abbreviation [MACTEX]     {Mac\-\TeX}  {\TEXLIVE\ on the Mac}
\abbreviation [METAFONT]   {\MF}        {graphic programming environment, bitmap output}
\abbreviation [METAPOST]   {MetaPost}   {graphic programming environment, vector output}
\abbreviation [MIKTEX]     {MiK\TeX}    {\TeX\ distribution for \WIN}
\abbreviation [MLTEX]      {ml\TeX}     {ML\TeX\ extension to \TEX}
\abbreviation [MPTOPDF]    {mptopdf}    {\METAPOST\ to \PDF\ conversion tool}
\abbreviation [PDFA]       {PDF/\kern-.05em A} {PDF A/* standards}
\abbreviation [PDFETEX]    {pdfe\TeX}   {\ETEX\ extension supporting \PDF\ output}
\abbreviation [PDFLATEX]   {pdf\LaTeX}  {\LATEX\ format using \PDFTEX, producing \PDF}
\abbreviation [PDFTEX]     {pdf\TeX}    {\TEX\ extension supporting \PDF\ output}
\abbreviation [PDF]        {PDF}        {Portable Document Format}
\abbreviation [PERL]       {Perl}       {Perl programming environment}
\abbreviation [PFA]        {PFA}        {Adobe PostScript Font format, ASCII}
\abbreviation [PFB]        {PFB}        {Adobe PostScript Font format, binary}
\abbreviation [PK]         {PK}         {Packed bitmap font}
\abbreviation [PNG]        {PNG}        {Portable Network Graphics}
\abbreviation [POSIX]      {POSIX}      {Portable Operating System Interface}
\abbreviation [POSTSCRIPT] {PostScript} {general graphics language}
\abbreviation [PSTOPDF]    {PStoPDF}    {PostScript to \PDF\ converter (on top of \GHOSTSCRIPT)}
\abbreviation [RGB]        {RGB}        {red--green--blue color specification}
\abbreviation [TCX]        {TCX}        {\TEX\ Character Translation}
\abbreviation [TDS]        {TDS}        {\TEX\ Directory Standard}
\abbreviation [TEXINFO]    {Texinfo}    {\GNU\ documentation format}
\abbreviation [TEXLIVE]    {\TeX\ Live} {\TeX\ Live distribution (cross-platform)}
\abbreviation [TEX]        {\TeX}       {typographic language and program}
\abbreviation [TFM]        {TFM}        {\TEX\ Font Metrics}
\abbreviation [TIF]        {TIFF}       {Tagged Interchange File format}
\abbreviation [TUG]        {TUG}        {\TEX\ Users Group, \texttt{tug.org}}
\abbreviation [UNIX]       {Unix}       {Unix platform}
\abbreviation [URL]        {url}        {Uniform Resource Locator}
\abbreviation [UTFEIGHT]   {\mbox{UTF-8}} {Uniform Resource Locator}
\abbreviation [WEBC]       {Web2C}      {Implementation framework for \TEX\ and friends}
\abbreviation [WEB]        {WEB}        {literate programming environment}
\abbreviation [WIN]        {Windows}    {Microsoft Windows platform}
\abbreviation [XETEX]      {Xe\TeX}     {the Xe\TeX\ engine}
