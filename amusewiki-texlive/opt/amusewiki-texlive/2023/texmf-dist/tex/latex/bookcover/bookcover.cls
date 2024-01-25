%%
%% This is file `bookcover.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ./bookcover.dtx  (with options: `class')
%% This is a generated file.
%% Copyright (C) 2015-2022 Tibor Tomacs
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{bookcover}[2022/12/29 v3.5 class for book covers and dust jackets]

%% OPTIONS

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=bookcover,prefix=bookcover@}
\DeclareVoidOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareVoidOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareVoidOption{12pt}{\PassOptionsToClass{12pt}{article}}
\DeclareStringOption[170mm]{coverwidth}
\DeclareStringOption[240mm]{coverheight}
\DeclareStringOption[5mm]{spinewidth}
\DeclareStringOption[0mm]{flapwidth}
\DeclareStringOption[0mm]{wrapwidth}
\DeclareStringOption[10mm]{marklength}
\DeclareStringOption[.4pt]{markthick}
\DeclareStringOption[5mm]{bleedwidth}
\DeclareStringOption[red]{markcolor}
\DeclareStringOption[white]{pagecolor}
\DeclareStringOption[white]{trimmingcolor}
\DeclareBoolOption[false]{trimmed}
\DeclareBoolOption[false]{foldingmargin}
\DeclareBoolOption[false]{bgtikznodes}% for old method
\DeclareBoolOption[false]{bgtikzclip}% for old method
\ProcessKeyvalOptions{bookcover}

%% CLASS AND PACKAGES

\LoadClass{article}
\@ifundefined{AddToHook}{\RequirePackage{lthooks,picture}}{}% for LaTeX format older than 2020/10/01
\RequirePackage{geometry,graphicx,calc,tikz,xparse,etoolbox}
\RequirePackage[nonefgrulers]{fgruler}

%% PAGE STYLE

\pagestyle{empty}
\def\ps@plain{}

%% NEW IF

\newif\if@inbookcoverenv

%% USER LENGTHS

\newlength{\coverwidth}
\newlength{\coverheight}
\newlength{\spinewidth}
\newlength{\flapwidth}
\newlength{\wrapwidth}
\newlength{\marklength}
\newlength{\markthick}
\newlength{\bleedwidth}

%% INTERNAL LENGTHS

\newlength{\bookcover@templength@a}
\newlength{\bookcover@templength@b}
\newlength{\bookcover@templength@c}
\newlength{\bookcover@templength@d}
\newlength{\bookcover@xpos@}
\newlength{\bookcover@ypos@}
\newlength{\bookcover@partwidth@}
\newlength{\bookcover@partheight@}
\newlength{\bookcover@tikz@trimmed@part@width@minus}
\newlength{\bookcover@tikz@trimmed@part@height@minus}
\newlength{\bookcover@tikz@trimmed@part@push@right}
\newlength{\bookcover@tikz@trimmed@part@push@up}
\let\partheight\bookcover@partheight@
\let\partwidth\bookcover@partwidth@

%% USER LENGTHS SETTING

\setlength{\coverwidth}{\bookcover@coverwidth}
\setlength{\coverheight}{\bookcover@coverheight}
\setlength{\spinewidth}{\bookcover@spinewidth}
\ifbookcover@foldingmargin\else\setlength{\flapwidth}{\bookcover@flapwidth}\fi
\ifdim\flapwidth>0pt\setlength{\wrapwidth}{\bookcover@wrapwidth}\fi
\setlength{\marklength}{\bookcover@marklength}
\setlength{\markthick}{\bookcover@markthick}
\setlength{\bleedwidth}{\bookcover@bleedwidth}

%% PAGE DIMENSIONS SETTING

\geometry{%
    margin=0pt,
    paperwidth=2\marklength+2\bleedwidth+2\coverwidth+2\flapwidth+2\wrapwidth+\spinewidth,
    paperheight=2\marklength+2\bleedwidth+\coverheight}

%% INTERNAL LENGTHS SETTING

\def\bookcover@xpos#1{\setlength{\bookcover@xpos@}{#1}}
\def\bookcover@ypos#1{\setlength{\bookcover@ypos@}{#1}}
\def\bookcover@partwidth#1{\setlength{\bookcover@partwidth@}{#1}}
\def\bookcover@partheight#1{\setlength{\bookcover@partheight@}{#1}}
\def\bookcover@tikz@trimmed@part@param#1#2#3#4{%
    \setlength{\bookcover@tikz@trimmed@part@width@minus}{#1}%
    \setlength{\bookcover@tikz@trimmed@part@height@minus}{#2}%
    \setlength{\bookcover@tikz@trimmed@part@push@right}{#3}%
    \setlength{\bookcover@tikz@trimmed@part@push@up}{#4}}
\let\setpartposx\bookcover@xpos
\let\setpartposy\bookcover@ypos
\let\setpartwidth\bookcover@partwidth
\let\setpartheight\bookcover@partheight
\let\settrimmedpart\bookcover@tikz@trimmed@part@param

%% SETBOOKCOVER

\newif\if@oldsetbookcover% for old method

\long\def\setbookcover#1{%
    \@for\bookcover@firstparam:={bgcolor,bgpic,bgtikz,fgsecond,fgfirst}\do{% for old method
        \ifdefstring{\bookcover@firstparam}{#1}{\global\@oldsetbookcovertrue}{}}% for old method
    \if@oldsetbookcover% for old method
        \gdef\bookcover@firstparam{#1}% for old method
    \else% for old method
        \gdef\oldsetbookcover@{}% for old method
        \setkeys{bookcover}{#1}%
        \setlength{\markthick}{\bookcover@markthick}%
    \fi\oldsetbookcover@% for old method
    }

%% BOOKCOVERDESCGEOMETRY

\def\bookcoverdescgeometry#1{\def\bookcover@descgeometry{#1}}
\def\bookcover@descgeometry{margin=1in}

%% BOOKCOVERDESCRIPTION

\newenvironment{bookcoverdescription}{%
    \if@inbookcoverenv\@latexerr{Don't use 'bookcoverdescription' in 'bookcover' environment!}{}\fi}{}
\AddToHook{env/bookcoverdescription/before}{\expandafter\newgeometry\expandafter{\bookcover@descgeometry}}
\AddToHook{env/bookcoverdescription/after}{\restoregeometry}

%% POSBOX

\newcommand{\bookcover@posbox}[5]{%
    \setlength{\bookcover@templength@a}{#4}%
    \put(#3,-\bookcover@templength@a){%
        \parbox[b][0pt][t]{#1}{%
            \parbox[t][#2][t]{#1}{#5}}}}

%% MARKS

\def\bookcover@marks{\bookcovercomponent{bookcovertype@tikz}{bookcoverpart@wholepage}{
    \begin{scope}[line width=\markthick,\bookcover@markcolor]
        \draw (\marklength+\bleedwidth,0mm) -- +(0mm,\marklength);
        \ifdim\flapwidth>0mm\draw (\marklength+\bleedwidth+\flapwidth+\wrapwidth,0) -- +(0,\marklength);\fi
        \draw (\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth,0) -- +(0,\marklength);
        \draw (\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth,0) -- +(0,\marklength);
        \ifdim\flapwidth>0mm\draw (\marklength+\bleedwidth+\flapwidth+\wrapwidth+2\coverwidth+\spinewidth,0) -- +(0,\marklength);\fi
        \draw (\marklength+\bleedwidth+2\flapwidth+2\wrapwidth+2\coverwidth+\spinewidth,0) -- +(0,\marklength);
        \draw (\marklength+\bleedwidth,\paperheight) -- +(0,-\marklength);
        \ifdim\flapwidth>0mm\draw (\marklength+\bleedwidth+\flapwidth+\wrapwidth,\paperheight) -- +(0,-\marklength);\fi%
        \draw (\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth,\paperheight) -- +(0,-\marklength);
        \draw (\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth,\paperheight) -- +(0,-\marklength);
        \ifdim\flapwidth>0mm\draw (\marklength+\bleedwidth+\flapwidth+\wrapwidth+2\coverwidth+\spinewidth,\paperheight) -- +(0,-\marklength);\fi
        \draw (\marklength+\bleedwidth+2\flapwidth+2\wrapwidth+2\coverwidth+\spinewidth,\paperheight) -- +(0,-\marklength);
        \draw (0,\paperheight-\marklength-\bleedwidth) -- +(\marklength,0);
        \draw (0,\marklength+\bleedwidth) -- +(\marklength,0);
        \draw (\paperwidth,\paperheight-\marklength-\bleedwidth) -- +(-\marklength,0);
        \draw (\paperwidth,\marklength+\bleedwidth) -- +(-\marklength,0);
        \ifbookcover@foldingmargin
            \draw (\marklength,0) -- +(0,\marklength);
            \draw (\paperwidth-\marklength,0) -- +(0,\marklength);
            \draw (\marklength,\paperheight) -- +(0,-\marklength);
            \draw (\paperwidth-\marklength,\paperheight) -- +(0,-\marklength);
            \draw (0,\marklength) -- +(\marklength,0);
            \draw (0,\paperheight-\marklength) -- +(\marklength,0);
            \draw (\paperwidth,\marklength) -- +(-\marklength,0);
            \draw (\paperwidth,\paperheight-\marklength) -- +(-\marklength,0);\fi
    \end{scope}}}

%% TRIMMING

\def\bookcover@trimming@part{%
    \expandafter\ifblank\expandafter{\bookcover@trimmedpart}{\def\bookcover@trimmedpart{bookcoverpart@whole}}{}%
    \@ifundefined{bookcover@part@param@\bookcover@trimmedpart}{\@latexerr{Part '\bookcover@trimmedpart' is undefined.}{}}{%
        \begingroup%
        \csname bookcover@part@param@\bookcover@trimmedpart\endcsname%
        \expandafter\bookcover@setpartmargin\expandafter(\bookcover@trimmedmargin)%
        \ifdim\bookcover@partwidth@>0mm
            \ifdim\bookcover@partheight@>0mm
                \bookcover@posbox{\paperwidth}{\paperheight}{0mm}{0mm}{%
                    \begin{tikzpicture}
                        \begin{scope}[\bookcover@trimmingcolor]
                        \fill (0,0) rectangle (\paperwidth,\paperheight-\bookcover@ypos@-\bookcover@partheight@);
                        \fill (0,\paperheight) rectangle (\paperwidth,\paperheight-\bookcover@ypos@);
                        \fill (0,0) rectangle (\bookcover@xpos@,\paperheight);
                        \fill (\bookcover@xpos@+\bookcover@partwidth@,0) rectangle (\paperwidth,\paperheight);
                        \end{scope}
                    \end{tikzpicture}}\fi\fi
        \endgroup}}

\NewDocumentCommand{\bookcovertrimmedpart}{ m O{,,,} }{\def\bookcover@trimmedpart{#1}\def\bookcover@trimmedmargin{#2}}
\bookcovertrimmedpart{bookcoverpart@whole}

%% BOOKCOVER ENVIRONMENT

\def\bookcover{%
    \@inbookcoverenvtrue%
    \newpage%
    \pagecolor{\bookcover@pagecolor}
    \noindent%
    \begin{picture}(\paperwidth,\paperheight)(0,-\paperheight)}

\def\endbookcover{%
    \ifbookcover@trimmed\bookcover@trimming@part\fi%
    \bookcover@marks%
    \end{picture}%
    \par\@inbookcoverenvfalse}

%% BOOKCOVER COMPONENT

\def\bookcover@setpartmargin(#1,#2,#3,#4){%
    \setlength{\bookcover@templength@a}{0mm}
    \setlength{\bookcover@templength@b}{0mm}
    \setlength{\bookcover@templength@c}{0mm}
    \setlength{\bookcover@templength@d}{0mm}
    \ifblank{#1}{}{\setlength{\bookcover@templength@a}{#1}}%
    \ifblank{#2}{}{\setlength{\bookcover@templength@b}{#2}}%
    \ifblank{#3}{}{\setlength{\bookcover@templength@c}{#3}}%
    \ifblank{#4}{}{\setlength{\bookcover@templength@d}{#4}}%
    \addtolength{\bookcover@xpos@}{\bookcover@templength@a}%
    \addtolength{\bookcover@partwidth@}{-\bookcover@templength@a}%
    \addtolength{\bookcover@partheight@}{-\bookcover@templength@b}%
    \addtolength{\bookcover@partwidth@}{-\bookcover@templength@c}%
    \addtolength{\bookcover@ypos@}{\bookcover@templength@d}%
    \addtolength{\bookcover@partheight@}{-\bookcover@templength@d}%
    \ifdim\bookcover@tikz@trimmed@part@width@minus>\dimexpr\bookcover@tikz@trimmed@part@push@right+\bookcover@templength@c\relax%
        \addtolength{\bookcover@tikz@trimmed@part@width@minus}{-\bookcover@tikz@trimmed@part@push@right-\bookcover@templength@c}%
        \else\setlength{\bookcover@tikz@trimmed@part@width@minus}{0mm}\fi%
    \ifdim\bookcover@tikz@trimmed@part@push@right>\bookcover@templength@a%
        \addtolength{\bookcover@tikz@trimmed@part@push@right}{-\bookcover@templength@a}%
        \else\setlength{\bookcover@tikz@trimmed@part@push@right}{0mm}\fi%
    \addtolength{\bookcover@tikz@trimmed@part@width@minus}{\bookcover@tikz@trimmed@part@push@right}%
    \ifdim\bookcover@tikz@trimmed@part@height@minus>\dimexpr\bookcover@tikz@trimmed@part@push@up+\bookcover@templength@d\relax%
        \addtolength{\bookcover@tikz@trimmed@part@height@minus}{-\bookcover@tikz@trimmed@part@push@up-\bookcover@templength@d}%
        \else\setlength{\bookcover@tikz@trimmed@part@height@minus}{0mm}\fi%
    \ifdim\bookcover@tikz@trimmed@part@push@up>\bookcover@templength@b%
        \addtolength{\bookcover@tikz@trimmed@part@push@up}{-\bookcover@templength@b}%
        \else\setlength{\bookcover@tikz@trimmed@part@push@up}{0mm}\fi%
    \addtolength{\bookcover@tikz@trimmed@part@height@minus}{\bookcover@tikz@trimmed@part@push@up}}

\NewDocumentCommand{\bookcovercomponent}{ m m O{,,,} +m }{%
    \if@inbookcoverenv\else%
        \@latexerr{Use \string\bookcovercomponent\space or 'bookcoverelement' in 'bookcover' environment!}{}\fi%
    \@ifundefined{bookcover@part@param@#2}{\@latexerr{Part '#2' is undefined.}{}}{%
        \@ifundefined{bookcover@componenttype@#1}{\@latexerr{Component type '#1' is undefined.}{}}{%
            \ifblank{#4}{}{%
                \begingroup%
                \csname bookcover@part@param@#2\endcsname%
                \bookcover@setpartmargin(#3)%
                \ifdim\bookcover@partwidth@>0mm%
                    \ifdim\bookcover@partheight@>0mm%
                        \csname bookcover@componenttype@#1\endcsname{#4}\fi\fi%
                \endgroup}}}}

%% BOOKCOVERELEMENT ENVIRONMENT

\NewDocumentEnvironment{bookcoverelement}{ m m O{,,,} +b }{\bookcovercomponent{#1}{#2}[#3]{#4}}

%% NEW BOOKCOVER PART

\def\newbookcoverpart#1#2{%
    \@ifundefined{bookcover@part@param@#1}{%
        \expandafter\def\csname bookcover@part@param@#1\endcsname{#2}}
    {\@latexerr{Part '#1' is already defined.}{}}}

%% RENEW BOOKCOVER PART

\def\renewbookcoverpart#1#2{%
    \ifstrequal{#1}{bookcoverpart@wholepage}{\@latexerr{Part '#1' is protected.}{}}%
    \ifstrequal{#1}{bookcoverpart@whole}{\@latexerr{Part '#1' is protected.}{}}%
    \@ifundefined{bookcover@part@param@#1}{\@latexerr{Part '#1' is undefined.}{}}{%
        \expandafter\def\csname bookcover@part@param@#1\endcsname{#2}}}

%% NEW NAME BOOKCOVER PART

\def\newnamebookcoverpart#1#2{%
    \@ifundefined{bookcover@part@param@#1}{%
        \@ifundefined{bookcover@part@param@#2}{\@latexerr{Part '#2' is undefined.}{}}{%
            \expandafter\def\csname bookcover@part@param@#1\endcsname{%
                \csname bookcover@part@param@#2\endcsname}}}
    {\@latexerr{Part '#1' is already defined.}{}}}

%% LET NAME BOOKCOVER PART

\NewDocumentCommand{\letnamebookcoverpart}{ m m O{,,,} }{%
    \@ifundefined{bookcover@part@param@#1}{%
        \@ifundefined{bookcover@part@param@#2}{\@latexerr{Part '#2' is undefined.}{}}{%
            \csletcs{bookcover@part@baseparam@#1}{bookcover@part@param@#2}%
            \protected@csedef{bookcover@part@margin@#1}{\bookcover@setpartmargin(#3)}%
            \protected@csedef{bookcover@part@param@#1}{\csuse{bookcover@part@baseparam@#1}\csuse{bookcover@part@margin@#1}}}}
    {\@latexerr{Part '#1' is already defined.}{}}}

%% NEW BOOKCOVER COMPONENT TYPE

\def\newbookcovercomponenttype#1#2{%
    \@ifundefined{bookcover@componenttype@#1}{%
        \long\expandafter\def\csname bookcover@componenttype@#1\endcsname##1{%
        \bookcover@posbox{\bookcover@partwidth@}{\bookcover@partheight@}{\bookcover@xpos@}{\bookcover@ypos@}{#2}}}
    {\@latexerr{Component type '#1' is already defined.}{}}}

%% RENEW BOOKCOVER COMPONENT TYPE

\def\renewbookcovercomponenttype#1#2{%
    \ifstrequal{#1}{bookcovertype@tikz}{\@latexerr{Component type '#1' is protected.}{}}%
    \@ifundefined{bookcover@componenttype@#1}{\@latexerr{Component type '#1' is undefined.}{}}{%
        \long\expandafter\def\csname bookcover@componenttype@#1\endcsname##1{%
        \bookcover@posbox{\bookcover@partwidth@}{\bookcover@partheight@}{\bookcover@xpos@}{\bookcover@ypos@}{#2}}}}

%% NEW NAME BOOKCOVER COMPONENT TYPE

\def\newnamebookcovercomponenttype#1#2{%
    \@ifundefined{bookcover@componenttype@#1}{%
        \@ifundefined{bookcover@componenttype@#2}{\@latexerr{Component type '#2' is undefined.}{}}{%
            \expandafter\def\csname bookcover@componenttype@#1\endcsname{%
                \csname bookcover@componenttype@#2\endcsname}}}
    {\@latexerr{Component type '#1' is already defined.}{}}}

%% LET NAME BOOKCOVER COMPONENT TYPE

\def\letnamebookcovercomponenttype#1#2{%
    \@ifundefined{bookcover@componenttype@#1}{%
        \@ifundefined{bookcover@componenttype@#2}{\@latexerr{Component type '#2' is undefined.}{}}{%
            \csletcs{bookcover@componenttype@#1}{bookcover@componenttype@#2}}}
    {\@latexerr{Component type '#1' is already defined.}{}}}

%% COMPONENT TYPES

\newbookcovercomponenttype{color}{%
    \tikz\fill\expandafter[#1] (0,0) rectangle (\bookcover@partwidth@,\bookcover@partheight@);}

\newbookcovercomponenttype{picture}{%
    \includegraphics[width=\bookcover@partwidth@,height=\bookcover@partheight@]{#1}}

\def\bookcover@tikz@content#1{%
    \begin{tikzpicture}[overlay,yshift=-\bookcover@partheight@]
    \begingroup
        \pgfset{minimum width=\bookcover@partwidth@,minimum height=\bookcover@partheight@}
        \pgfnode{rectangle}{south west}{}{part}{\pgfusepath{}}
        \pgfset{minimum width=\bookcover@partwidth@-\bookcover@tikz@trimmed@part@width@minus,
                minimum height=\bookcover@partheight@-\bookcover@tikz@trimmed@part@height@minus}
        \pgftransformshift{\pgfpoint{\bookcover@tikz@trimmed@part@push@right}
                                    {\bookcover@tikz@trimmed@part@push@up}}
        \pgfnode{rectangle}{south west}{}{trimmed part}{\pgfusepath{}}
        \pgfnodealias{current trimmed part}{trimmed part}% for old method
        \pgfnodealias{current part}{part}% for old method
    \endgroup
    #1
    \end{tikzpicture}}

\newbookcovercomponenttype{tikz}{\bookcover@tikz@content{#1}}

\letnamebookcovercomponenttype{bookcovertype@tikz}{tikz} % bookcovertype@tikz is protected type

\newbookcovercomponenttype{tikz clip}{\bookcover@tikz@content{\clip (part.south west) rectangle (part.north east);#1}}

\newbookcovercomponenttype{normal}{#1}

\newbookcovercomponenttype{center}{\vfill{\centering#1\\}\vfill}

\newbookcovercomponenttype{ruler}{\expandafter\bookcover@setruler\expandafter(#1)}

\def\bookcover@setruler(#1,#2,#3){%
    \rulernorotatenum%
    \ifblank{#3}{\rulerparams{}{}{\bookcover@markcolor}{}{}}{\rulerparams{}{}{#3}{}{}}%
    \ifblank{#2}%
        {\ifblank{#1}%
            {\squareruler{upperleft}{\bookcover@partwidth@}{\bookcover@partheight@}}%
            {\squareruler[#1]{upperleft}{\bookcover@partwidth@}{\bookcover@partheight@}}}%
        {\ifblank{#1}%
            {\squareruler{#2}{\bookcover@partwidth@}{\bookcover@partheight@}}%
            {\squareruler[#1]{#2}{\bookcover@partwidth@}{\bookcover@partheight@}}}}

%% BOOKCOVER PARTS

\newbookcoverpart{bg back flap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength}
        \bookcover@partheight{\coverheight+2\bleedwidth}
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{\flapwidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg back wrap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength}
        \bookcover@partheight{\coverheight+2\bleedwidth}
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
        \bookcover@partwidth{\wrapwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}\fi}

\newbookcoverpart{bg back}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
        \bookcover@partwidth{\coverwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{\coverwidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg spine}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \bookcover@partwidth{\spinewidth}
    \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}}

\newbookcoverpart{bg front}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
    \ifdim\flapwidth>0mm
        \bookcover@partwidth{\coverwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@partwidth{\coverwidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0pt}{\bleedwidth}\fi}

\newbookcoverpart{bg front wrap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength}
        \bookcover@partheight{\coverheight+2\bleedwidth}
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+2\coverwidth+\spinewidth}
        \bookcover@partwidth{\wrapwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}\fi}

\newbookcoverpart{bg front flap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength}
        \bookcover@partheight{\coverheight+2\bleedwidth}
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+2\wrapwidth+2\coverwidth+\spinewidth}
        \bookcover@partwidth{\flapwidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0pt}{\bleedwidth}\fi}

\newbookcoverpart{bg back flap and wrap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength}
        \bookcover@partheight{\coverheight+2\bleedwidth}
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{\flapwidth+\wrapwidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg back and wrap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
        \bookcover@partwidth{\coverwidth+\wrapwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{\coverwidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg back and spine}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
        \bookcover@partwidth{\coverwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{\coverwidth+\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg front and spine}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \ifdim\flapwidth>0mm
        \bookcover@partwidth{\coverwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@partwidth{\coverwidth+\spinewidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0pt}{\bleedwidth}\fi}

\newbookcoverpart{bg front and wrap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
    \ifdim\flapwidth>0mm
        \bookcover@partwidth{\coverwidth+\wrapwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@partwidth{\coverwidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0pt}{\bleedwidth}\fi}

\newbookcoverpart{bg front flap and wrap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength}
        \bookcover@partheight{\coverheight+2\bleedwidth}
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+2\coverwidth+\spinewidth}
        \bookcover@partwidth{\flapwidth+\wrapwidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0pt}{\bleedwidth}\fi}

\newbookcoverpart{bg back and flap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength}
    \bookcover@partwidth{\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}}

\newbookcoverpart{bg back and spine and wrap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
        \bookcover@partwidth{\wrapwidth+\coverwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{\wrapwidth+\coverwidth+\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg back and spine and front}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
        \bookcover@partwidth{2\coverwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{2\coverwidth+2\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg front and spine and wrap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \ifdim\flapwidth>0mm
        \bookcover@partwidth{\coverwidth+\spinewidth+\wrapwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@partwidth{\coverwidth+\spinewidth+\bleedwidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0pt}{\bleedwidth}\fi}

\newbookcoverpart{bg front and flap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
    \bookcover@partwidth{\coverwidth+\flapwidth+\wrapwidth+\bleedwidth}
    \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0pt}{\bleedwidth}}

\newbookcoverpart{bg back and flap and spine}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength}
    \bookcover@partwidth{\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
    \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}}

\newbookcoverpart{bg back and spine and front and back wrap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
        \bookcover@partwidth{2\coverwidth+\spinewidth+\wrapwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{2\coverwidth+2\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg back and spine and front and front wrap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
        \bookcover@partwidth{2\coverwidth+\spinewidth+\wrapwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{2\coverwidth+2\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg front and flap and spine}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \bookcover@partwidth{\coverwidth+\flapwidth+\bleedwidth+\wrapwidth+\spinewidth}
    \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0pt}{\bleedwidth}}

\newbookcoverpart{bg whole without front flap and wrap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength}
    \ifdim\flapwidth>0mm
        \bookcover@partwidth{2\coverwidth+\flapwidth+\wrapwidth+\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}
    \else
        \bookcover@partwidth{2\coverwidth+2\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg whole without flaps}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
        \bookcover@partwidth{2\coverwidth+\spinewidth+2\wrapwidth}
        \bookcover@tikz@trimmed@part@param{0pt}{2\bleedwidth}{0pt}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{2\coverwidth+2\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg whole without back flap and wrap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
        \bookcover@partwidth{2\coverwidth+\flapwidth+\wrapwidth+\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0mm}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{2\coverwidth+2\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg whole without front flap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength}
    \ifdim\flapwidth>0mm
        \bookcover@partwidth{2\coverwidth+\flapwidth+2\wrapwidth+\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}
    \else
        \bookcover@partwidth{2\coverwidth+2\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg whole without back flap}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \ifdim\flapwidth>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
        \bookcover@partwidth{2\coverwidth+\flapwidth+2\wrapwidth+\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{\bleedwidth}{2\bleedwidth}{0mm}{\bleedwidth}
    \else
        \bookcover@xpos{\marklength}
        \bookcover@partwidth{2\coverwidth+2\bleedwidth+\spinewidth}
        \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}\fi}

\newbookcoverpart{bg whole}{
    \bookcover@ypos{\marklength}
    \bookcover@partheight{\coverheight+2\bleedwidth}
    \bookcover@xpos{\marklength}
    \bookcover@partwidth{2\coverwidth+2\bleedwidth+2\flapwidth+2\wrapwidth+\spinewidth}
    \bookcover@tikz@trimmed@part@param{2\bleedwidth}{2\bleedwidth}{\bleedwidth}{\bleedwidth}}

\newbookcoverpart{whole page}{
    \bookcover@partheight{\paperheight}
    \bookcover@partwidth{\paperwidth}}

\letnamebookcoverpart{bookcoverpart@wholepage}{whole page} % bookcoverpart@wholepage is protected part

\newbookcoverpart{back flap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength+\bleedwidth}
        \bookcover@partheight{\coverheight}
        \bookcover@xpos{\marklength+\bleedwidth}
        \bookcover@partwidth{\flapwidth}\fi}

\newbookcoverpart{back wrap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength+\bleedwidth}
        \bookcover@partheight{\coverheight}
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
        \bookcover@partwidth{\wrapwidth}\fi}

\newbookcoverpart{back}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
    \bookcover@partwidth{\coverwidth}}

\newbookcoverpart{spine}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \bookcover@partwidth{\spinewidth}}

\newbookcoverpart{front}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
    \bookcover@partwidth{\coverwidth}}

\newbookcoverpart{front wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+2\coverwidth+\spinewidth}
    \bookcover@partwidth{\wrapwidth}}

\newbookcoverpart{front flap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength+\bleedwidth}
        \bookcover@partheight{\coverheight}
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+2\wrapwidth+2\coverwidth+\spinewidth}
        \bookcover@partwidth{\flapwidth}\fi}

\newbookcoverpart{above front}{
    \ifdim\marklength>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
        \bookcover@ypos{0mm}
        \bookcover@partwidth{\coverwidth}
        \bookcover@partheight{\marklength}\fi}

\newbookcoverpart{below front}{
    \ifdim\marklength>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
        \bookcover@ypos{\marklength+2\bleedwidth+\coverheight}
        \bookcover@partwidth{\coverwidth}
        \bookcover@partheight{\marklength}\fi}

\newbookcoverpart{above back}{
    \ifdim\marklength>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
        \bookcover@ypos{0mm}
        \bookcover@partwidth{\coverwidth}
        \bookcover@partheight{\marklength}\fi}

\newbookcoverpart{below back}{
    \ifdim\marklength>0mm
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
        \bookcover@ypos{\marklength+2\bleedwidth+\coverheight}
        \bookcover@partwidth{\coverwidth}
        \bookcover@partheight{\marklength}\fi}

\newbookcoverpart{back flap and wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth}
    \bookcover@partwidth{\flapwidth+\wrapwidth}}

\newbookcoverpart{back and wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
    \bookcover@partwidth{\coverwidth+\wrapwidth}}

\newbookcoverpart{back and spine}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
    \bookcover@partwidth{\coverwidth+\spinewidth}}

\newbookcoverpart{front and spine}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \bookcover@partwidth{\coverwidth+\spinewidth}}

\newbookcoverpart{front and wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
    \bookcover@partwidth{\coverwidth+\wrapwidth}}

\newbookcoverpart{front flap and wrap}{
    \ifdim\flapwidth>0mm
        \bookcover@ypos{\marklength+\bleedwidth}
        \bookcover@partheight{\coverheight}
        \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+2\coverwidth+\spinewidth}
        \bookcover@partwidth{\flapwidth+\wrapwidth}\fi}

\newbookcoverpart{back and flap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth}
    \bookcover@partwidth{\flapwidth+\wrapwidth+\coverwidth}
    \bookcover@partheight{\coverheight}}

\newbookcoverpart{back and spine and wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
    \bookcover@partwidth{\coverwidth+\spinewidth+\wrapwidth}}

\newbookcoverpart{back and spine and front}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
    \bookcover@partwidth{2\coverwidth+\spinewidth}}

\newbookcoverpart{front and spine and wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \bookcover@partwidth{\coverwidth+\spinewidth+\wrapwidth}}

\newbookcoverpart{front and flap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
    \bookcover@partwidth{\coverwidth+\flapwidth+\wrapwidth}}

\newbookcoverpart{back and flap and spine}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@xpos{\marklength+\bleedwidth}
    \bookcover@partwidth{\flapwidth+\wrapwidth+\coverwidth+\spinewidth}
    \bookcover@partheight{\coverheight}}

\newbookcoverpart{back and spine and front and back wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
    \bookcover@partwidth{2\coverwidth+\spinewidth+\wrapwidth}}

\newbookcoverpart{back and spine and front and front wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
    \bookcover@partwidth{2\coverwidth+\spinewidth+\wrapwidth}}

\newbookcoverpart{front and flap and spine}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth+\coverwidth}
    \bookcover@partwidth{\coverwidth+\flapwidth+\wrapwidth+\spinewidth}}

\newbookcoverpart{whole without front flap and wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth}
    \bookcover@partwidth{2\coverwidth+\flapwidth+\wrapwidth+\spinewidth}}

\newbookcoverpart{whole without flaps}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
    \bookcover@partwidth{2\coverwidth+\spinewidth+2\wrapwidth}}

\newbookcoverpart{whole without back flap and wrap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth+\wrapwidth}
    \bookcover@partwidth{2\coverwidth+\flapwidth+\wrapwidth+\spinewidth}}

\newbookcoverpart{whole without front flap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth}
    \bookcover@partwidth{2\coverwidth+\flapwidth+2\wrapwidth+\spinewidth}}

\newbookcoverpart{whole without back flap}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth+\flapwidth}
    \bookcover@partwidth{2\coverwidth+\flapwidth+2\wrapwidth+\spinewidth}}

\newbookcoverpart{whole}{
    \bookcover@ypos{\marklength+\bleedwidth}
    \bookcover@partheight{\coverheight}
    \bookcover@xpos{\marklength+\bleedwidth}
    \bookcover@partwidth{2\coverwidth+2\flapwidth+2\wrapwidth+\spinewidth}}

\letnamebookcoverpart{bookcoverpart@whole}{whole} % bookcoverpart@whole is protected part

%% SYNONYMOUS PART NAMES FOR INSIDE COVER ('INSIDE FRONT' = 'BACK', 'INSIDE BACK' = 'FRONT')

\@for\bookcover@partname@:={%
bg back flap,bg back wrap,bg back,bg front,bg front wrap,bg front flap,%
bg back flap and wrap,bg back and wrap,bg back and spine,bg front and spine,bg front and wrap,bg front flap and wrap,%
bg back and flap,bg back and spine and wrap,bg back and spine and front,bg front and spine and wrap,bg front and flap,%
bg back and flap and spine,bg back and spine and front and back wrap,bg back and spine and front and front wrap,bg front and flap and spine,%
bg whole without front flap and wrap,bg whole without back flap and wrap,%
bg whole without front flap,bg whole without back flap,%
back flap,back wrap,back,front,front wrap,front flap,above back,above front,below back,below front,%
back flap and wrap,back and wrap,back and spine,front and spine,front and wrap,front flap and wrap,%
back and flap,back and spine and wrap,back and spine and front,front and spine and wrap,front and flap,%
back and flap and spine,back and spine and front and back wrap,back and spine and front and front wrap,front and flap and spine,%
whole without front flap and wrap,whole without back flap and wrap,%
whole without front flap,whole without back flap}%
\do{%
\let\bookcover@partname@original@\bookcover@partname@%
\patchcmd{\bookcover@partname@}{back}{b@ck}{}{}%
\patchcmd{\bookcover@partname@}{front}{fr@nt}{}{}%
\patchcmd{\bookcover@partname@}{b@ck}{inside front}{}{}%
\patchcmd{\bookcover@partname@}{fr@nt}{inside back}{}{}%
\letnamebookcoverpart{\bookcover@partname@}{\bookcover@partname@original@}}

%% SHORT PART NAMES

\def\bookcover@shortpartname@#1=#2.{\letnamebookcoverpart{#1}{#2}\letnamebookcoverpart{bg #1}{bg #2}}
\@for\bookcover@partname@:={%
lF=back flap.,lW=back wrap.,lC=back.,S=spine.,rC=front.,rW=front wrap.,rF=front flap.,%
lF-lW=back flap and wrap.,lW-lC=back and wrap.,lC-S=back and spine.,S-rC=front and spine.,rC-rW=front and wrap.,rW-rF=front flap and wrap.,%
lF-lC=back and flap.,lW-S=back and spine and wrap.,lC-rC=back and spine and front.,S-rW=front and spine and wrap.,rC-rF=front and flap.,%
lF-S=back and flap and spine.,lW-rC=back and spine and front and back wrap.,lC-rW=back and spine and front and front wrap.,S-rF=front and flap and spine.,%
lF-rC=whole without front flap and wrap.,lW-rW=whole without flaps.,lC-rF=whole without back flap and wrap.,%
lF-rW=whole without front flap.,lW-rF=whole without back flap.,%
lF-rF=whole.}%
\do{\expandafter\bookcover@shortpartname@\bookcover@partname@}

\letnamebookcoverpart{remark}{above front}% for old method

%% OLD METHOD

\def\bookcover@reset{
    \def\bookcover@bgcolor@whole{}
    \def\bookcover@bgcolor@wholewf{}
    \def\bookcover@bgcolor@back{}
    \def\bookcover@bgcolor@front{}
    \def\bookcover@bgcolor@backflap{}
    \def\bookcover@bgcolor@frontflap{}
    \def\bookcover@bgcolor@spine{}
    \def\bookcover@bgpic@whole{}
    \def\bookcover@bgpic@wholewf{}
    \def\bookcover@bgpic@back{}
    \def\bookcover@bgpic@front{}
    \def\bookcover@bgpic@backflap{}
    \def\bookcover@bgpic@frontflap{}
    \def\bookcover@bgpic@spine{}
    \def\bookcover@bgtikz@whole{}
    \def\bookcover@bgtikz@wholewf{}
    \def\bookcover@bgtikz@back{}
    \def\bookcover@bgtikz@front{}
    \def\bookcover@bgtikz@backflap{}
    \def\bookcover@bgtikz@frontflap{}
    \def\bookcover@bgtikz@spine{}
    \def\bookcover@fgsecond@back{}
    \def\bookcover@fgsecond@front{}
    \def\bookcover@fgsecond@spine{}
    \def\bookcover@fgsecond@backflap{}
    \def\bookcover@fgsecond@frontflap{}
    \def\bookcover@fgfirst@back{}
    \def\bookcover@fgfirst@front{}
    \def\bookcover@fgfirst@spine{}
    \def\bookcover@fgfirst@backflap{}
    \def\bookcover@fgfirst@frontflap{}
    \def\bookcover@fgfirst@abovefront{}
    \def\bookcover@fgfirst@belowfront{}
    \def\bookcover@fgfirst@aboveback{}
    \def\bookcover@fgfirst@belowback{}}

\bookcover@reset

\long\def\oldsetbookcover@#1#2{
    \ifdefstring{\bookcover@firstparam}{bgcolor}{
        \ifstrequal{#1}{whole}{\def\bookcover@bgcolor@whole{\bookcovercomponent{color}{bg #1}{#2}}}{}
        \ifstrequal{#1}{whole without flaps}{\def\bookcover@bgcolor@wholewf{\bookcovercomponent{color}{bg #1}{#2}}}{}
        \ifstrequal{#1}{back}{\def\bookcover@bgcolor@back{\bookcovercomponent{color}{bg #1}{#2}}}{}
        \ifstrequal{#1}{front}{\def\bookcover@bgcolor@front{\bookcovercomponent{color}{bg #1}{#2}}}{}
        \ifstrequal{#1}{back flap}{\def\bookcover@bgcolor@backflap{\bookcovercomponent{color}{bg #1}{#2}}}{}
        \ifstrequal{#1}{front flap}{\def\bookcover@bgcolor@frontflap{\bookcovercomponent{color}{bg #1}{#2}}}{}
        \ifstrequal{#1}{spine}{\def\bookcover@bgcolor@spine{\bookcovercomponent{color}{bg #1}{#2}}}{}}{}
    \ifdefstring{\bookcover@firstparam}{bgpic}{
        \ifstrequal{#1}{whole}{\def\bookcover@bgpic@whole{\bookcovercomponent{picture}{bg #1}{#2}}}{}
        \ifstrequal{#1}{whole without flaps}{\def\bookcover@bgpic@wholewf{\bookcovercomponent{picture}{bg #1}{#2}}}{}
        \ifstrequal{#1}{back}{\def\bookcover@bgpic@back{\bookcovercomponent{picture}{bg #1}{#2}}}{}
        \ifstrequal{#1}{front}{\def\bookcover@bgpic@front{\bookcovercomponent{picture}{bg #1}{#2}}}{}
        \ifstrequal{#1}{back flap}{\def\bookcover@bgpic@backflap{\bookcovercomponent{picture}{bg #1}{#2}}}{}
        \ifstrequal{#1}{front flap}{\def\bookcover@bgpic@frontflap{\bookcovercomponent{picture}{bg #1}{#2}}}{}
        \ifstrequal{#1}{spine}{\def\bookcover@bgpic@spine{\bookcovercomponent{picture}{bg #1}{#2}}}{}}{}
    \ifdefstring{\bookcover@firstparam}{bgtikz}{
        \ifbookcover@bgtikzclip
        \ifstrequal{#1}{whole}{\def\bookcover@bgtikz@whole{\bookcovercomponent{tikz clip}{bg #1}{#2}}}{}
        \ifstrequal{#1}{whole without flaps}{\def\bookcover@bgtikz@wholewf{\bookcovercomponent{tikz clip}{bg #1}{#2}}}{}
        \ifstrequal{#1}{back}{\def\bookcover@bgtikz@back{\bookcovercomponent{tikz clip}{bg #1}{#2}}}{}
        \ifstrequal{#1}{front}{\def\bookcover@bgtikz@front{\bookcovercomponent{tikz clip}{bg #1}{#2}}}{}
        \ifstrequal{#1}{back flap}{\def\bookcover@bgtikz@backflap{\bookcovercomponent{tikz clip}{bg #1}{#2}}}{}
        \ifstrequal{#1}{front flap}{\def\bookcover@bgtikz@frontflap{\bookcovercomponent{tikz clip}{bg #1}{#2}}}{}
        \ifstrequal{#1}{spine}{\def\bookcover@bgtikz@spine{\bookcovercomponent{tikz clip}{bg #1}{#2}}}{}
        \else
        \ifstrequal{#1}{whole}{\def\bookcover@bgtikz@whole{\bookcovercomponent{tikz}{bg #1}{#2}}}{}
        \ifstrequal{#1}{whole without flaps}{\def\bookcover@bgtikz@wholewf{\bookcovercomponent{tikz}{bg #1}{#2}}}{}
        \ifstrequal{#1}{back}{\def\bookcover@bgtikz@back{\bookcovercomponent{tikz}{bg #1}{#2}}}{}
        \ifstrequal{#1}{front}{\def\bookcover@bgtikz@front{\bookcovercomponent{tikz}{bg #1}{#2}}}{}
        \ifstrequal{#1}{back flap}{\def\bookcover@bgtikz@backflap{\bookcovercomponent{tikz}{bg #1}{#2}}}{}
        \ifstrequal{#1}{front flap}{\def\bookcover@bgtikz@frontflap{\bookcovercomponent{tikz}{bg #1}{#2}}}{}
        \ifstrequal{#1}{spine}{\def\bookcover@bgtikz@spine{\bookcovercomponent{tikz}{bg #1}{#2}}}{}
        \fi}{}
    \ifdefstring{\bookcover@firstparam}{fgsecond}{
        \ifstrequal{#1}{back}{\def\bookcover@fgsecond@back{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{front}{\def\bookcover@fgsecond@front{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{spine}{\def\bookcover@fgsecond@spine{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{back flap}{\def\bookcover@fgsecond@backflap{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{front flap}{\def\bookcover@fgsecond@frontflap{\bookcovercomponent{normal}{#1}{#2}}}{}}{}
    \ifdefstring{\bookcover@firstparam}{fgfirst}{
        \ifstrequal{#1}{back}{\def\bookcover@fgfirst@back{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{front}{\def\bookcover@fgfirst@front{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{spine}{\def\bookcover@fgfirst@spine{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{back flap}{\def\bookcover@fgfirst@backflap{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{front flap}{\def\bookcover@fgfirst@frontflap{\bookcovercomponent{normal}{#1}{#2}}}{}
        \ifstrequal{#1}{remark}{\def\bookcover@fgfirst@abovefront{\bookcovercomponent{center}{#1}{#2}}}{}
        \ifstrequal{#1}{above front}{\def\bookcover@fgfirst@abovefront{\bookcovercomponent{center}{#1}{#2}}}{}
        \ifstrequal{#1}{below front}{\def\bookcover@fgfirst@belowfront{\bookcovercomponent{center}{#1}{#2}}}{}
        \ifstrequal{#1}{above back}{\def\bookcover@fgfirst@aboveback{\bookcovercomponent{center}{#1}{#2}}}{}
        \ifstrequal{#1}{below back}{\def\bookcover@fgfirst@belowback{\bookcovercomponent{center}{#1}{#2}}}{}}{}}

\long\def\makebookcover{%
    \begin{bookcover}
        \bookcover@bgcolor@whole
        \bookcover@bgcolor@wholewf
        \bookcover@bgcolor@back
        \bookcover@bgcolor@front
        \bookcover@bgcolor@backflap
        \bookcover@bgcolor@frontflap
        \bookcover@bgcolor@spine
        \bookcover@bgpic@whole
        \bookcover@bgpic@wholewf
        \bookcover@bgpic@back
        \bookcover@bgpic@front
        \bookcover@bgpic@backflap
        \bookcover@bgpic@frontflap
        \bookcover@bgpic@spine
        \bookcover@bgtikz@whole
        \bookcover@bgtikz@wholewf
        \bookcover@bgtikz@back
        \bookcover@bgtikz@front
        \bookcover@bgtikz@backflap
        \bookcover@bgtikz@frontflap
        \bookcover@bgtikz@spine
        \bookcover@fgsecond@back
        \bookcover@fgsecond@front
        \bookcover@fgsecond@spine
        \bookcover@fgsecond@backflap
        \bookcover@fgsecond@frontflap
        \bookcover@fgfirst@back
        \bookcover@fgfirst@front
        \bookcover@fgfirst@spine
        \bookcover@fgfirst@backflap
        \bookcover@fgfirst@frontflap
        \bookcover@fgfirst@abovefront
        \bookcover@fgfirst@belowfront
        \bookcover@fgfirst@aboveback
        \bookcover@fgfirst@belowback
    \end{bookcover}
    \bookcover@reset}

\endinput
%%
%% End of file `bookcover.cls'.
