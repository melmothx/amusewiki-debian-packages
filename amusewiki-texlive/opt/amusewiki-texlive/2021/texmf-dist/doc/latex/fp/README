fp-package

(c) Michael Mehlich 1994 -- 1999
contributions by: Denis Girou
acknowledgment to: Denis Girou, Miroslav Balda, Ricardo Sanchez Carmenes

% Copyright 1994 -- 1999 Michael Mehlich
% This package can be redistributed and/or modified under the terms
% of the LaTeX Project Public License Distributed from CTAN
% archives at http://www.latex-project.org/lppl.txt either
% version 1 of the License, or any later version.

(current) e-mail: mmehlich@semdesigns.com; michael@mehlich.com

Fixed point arithmetic for TeX with numbers ranging from
   -999999999999999999.999999999999999999
to
   +999999999999999999.999999999999999999

TODO:
     - better documentation (it is really bad)

USAGE:
     - LaTeX2e:
         \usepackage[<options>]{fp}
	 where the following options are known:
	   nomessages:  don't print messages about the functions that are
	   		just computed
	   debug:	print debug messages (mainly for \FPupn)
     - LaTeX2.09:
         include lfp.sty in the document preamble, i.e.
         \documentstyle[...,lfp,...]{...}
     - TeX:
         \input fp.tex

MsDos/Windows Users:
     It may be necessary to rename some files such that they just have a length of 
     eight characters (plus a three character suffix).
     The following renaming e.g. works for emtex:
	Original name	Name for emtex
	 defpattern.sty	 defpaern.sty
	 fp-addons.sty	 fp-adons.sty
	 fp-random.sty	 fp-radom.sty

FILES AND THEIR CONTENTS:
     - readme.fp:
         this file
     - fp.sty
         includes all files
     - defpattern.sty:
         only for internal usage
     - fp-basic.sty:
	 The following macros are public ones to be used in the document:
	   %controlling messages
	     \FPmessagestrue	% print standard FP-messages (default)
	     \FPmessagesfalse   % suppress standard FP-messages
	     \FPdebugtrue    	% print debug messages (mainly for upn)
	     \FPdebugfalse	% suppress debug messages (default)
	   %introduction of new values
	     \FPset#1#2		% #1 := #2  (#1 may be macro or string)
	   %print values
	     \FPprint#1		% prints #1 (#1 may be macro or string)
           %binary operations
             \FPadd#1#2#3	% #1 := #2+#3
             \FPdiv#1#2#3	% #1 := #2/#3
             \FPmul#1#2#3	% #1 := #2*#3
             \FPsub#1#2#3	% #1 := #2-#3
           %unary operations
             \FPabs#1#2		% #1 := abs(#2)
             \FPneg#1#2		% #1 := -#2
           %binary relations
             \FPiflt#1#2...\else...\fi % #1 < #2 ?
             \FPifeq#1#2...\else...\fi % #1 = #2 ?
             \FPifgt#1#2...\else...\fi % #1 > #2 ?
           %unary relations
             \FPifneg#1 ...\else...\fi % #1 <  0 ?
             \FPifpos#1 ...\else...\fi % #1 >= 0 ?
             \FPifzero#1...\else...\fi % #1 =  0 ?
             \FPifint#1 ...\else...\fi % #1 is integer ?
           %repeat last test
             \ifFPtest  ...\else...\fi % repeat last test
     - fp-addons.sty
	 The following macros are public ones to be used in the document:
	   %binary operations
	     \FPmin#1#2#3	% #1 = min(#2,#3)
	     \FPmax#1#2#3	% #1 = max(#2,#3)
     - fp-eqn.sty (No warranty on correctness and especially on numerical problems!)
         The following macros are public ones to be used in the document:
	   \FPlsolve#1#2#3           
		% #1 := x with #2*x+#3=0
	   \FPqsolve#1#2#3#4#5 
		% #1,#2 := x with #3*x^2+#4*x+#5 = 0
	   \FPcsolve#1#2#3#4#5#6#7
		% #1,#2,#3 := x with #4*x^3+#5*x^2+#6*x+#7 = 0
	   \FPqqsolve#1#2#3#4#5#6#7#8#9
		% #1,#2,#3,#4 := x with #5*x^4+#6*x^3+#7*x^2+#8*x+#9 = 0
	 The resulting solutions are all real values. If there do not
	 exist as much solutions you get a warning message and some
	 other solutions occur several times in the solution vector.
     - fp-exp.sty
         The following macros are public ones to be used in the document:
           \FPe			% 2.718281828459045235
	   \FPexp#1#2 		% #1 := e^(#2)
	   \FPln#1#2		% #1 := ln(#2)
	   \FPpow#1#2#3  	% #1 := (#2)^(#3)
	   \FProot#1#2#3        % #1 := (#2)^(1/#3)
     - fp-random.sty
         The following macros are public ones to be used in the document:
	   \FPseed=#1		% set seed counter for random number generation
	   \FPrandom#1		% #1 := a random number between 0 and 1
     - fp-pas.sty
         The following macros are public ones to be used in the document:
           \FPpascal#1#2 	% #1 := #2-th line of the pascal triangle
     - fp-snap.sty:
         The following macros are public ones to be used in the document:
	   \FPround#1#2#3       % #1 := #2 rounded   to #3 digits after '.'
	   \FPtrunc#1#2#3       % #1 := #2 truncated to #3 digits after '.'
           \FPclip#1#2		% #1 := #2 with all unnecessary 0's removed
     - fp-trigo.sty:
         The following macros are public ones to be used in the document:
	   \FPpi 		% 3.141592653589793238
	   \FPsin#1#2		% #1 := sin(#2)
	   \FPcos#1#2 		% #1 := cos(#2)
	   \FPsincos#1#2#3	% #1 := sin(#3), #2 := cos(#3)
	   \FPtan#1#2		% #1 := tan(#2)
	   \FPcot#1#2 		% #1 := cot(#2)
	   \FPtancot#1#2#3 	% #1 := tan(#3), #2 := cot(#3)
   	   \FParcsin#1#2	% #1 := arcsin(#2)
	   \FParccos#1#2     	% #1 := arccos(#2)
	   \FParcsincos#1#2#3   % #1 := arcsin(#3), #2 := arccos(#3)
	   \FParctan#1#2 	% #1 := arctan(#2)
	   \FParccot#1#2 	% #1 := arccot(#2)
	   \FParctancot#1#2#3	% #1 := arctan(#3), #2 := arccot(#3)
     - fp-upn.sty:
         The following macros are public ones to be used in the document:
           \FPupn#1#2 		% #1 := eval(#2) where eval evaluates the
	   					 upn-expression #2
	 Known operations are:
	   +,add,-,sub,*,mul,/,div,abs,neg,min,max,
	   round,trunc,clip,e,exp,ln,pow,root,pi,sin,cos,
	   sincos,tan,cot,tancot,arcsin,arccos,arcsincos,
	   arctan,arccot,arctancot,pop,swap,copy
	   where
	     pop  removes the top element
	     swap exchanges the first two elements
	     copy copies the top element
	 Example 1:
	   The macro call
             \FPupn\result{17 2.5 + 17.5 - 2 1 + * 2 swap /} 
	   is equivalent to
	     \result := ((17.5 - (17 + 2.5)) * (2 + 1)) / 2
	   and evaluates to
	     \def\result{-3.000000000000000000}
	   Afterwards the macro call
             \FPupn\result{\result{} -1 * 0.2 + sin 2 round}
	                          ^^ the "{}" is necessary!
	   is equivalent to
	     \result := round_2(sin((\result * -1) + 0.2))
	   and evaluates to
             \def\result{-0.06}
	 Example 2:
	   As "result" is an abbreviation of "\result{}" you may
	   write
	     \FPupn{result}{17 2.5 + 17.5 - 2 1 + * 2 swap /}
	   and
	     \FPupn{result}{result -1 * 0.2 + sin 2 round}
	   instead leading to the same results.
	   This is even true for other macro names using e.g. "x" for "\x{}"
	   and so on. But be careful with it. We may introduce new constants
	   in further versions overwriting these abbreviations.
     - fp-eval.sty:
         The following macros are public ones to be used in the document:
           \FPeval#1#2 		% #1 := eval(#2) where eval evaluates the
	   					 expression #2
	 ATTENTION: Do not use macro names with \. for its own
	 Use only the name or the macro surrounded by (, and ) instead,
	 i.e. do not write "\value{}" but "value" or "(\value)".
	 This is needed to avoid problems with a prefix "-" of numbers.
	 (I do not intend to write a more complex parsing routine in future.
	  But if you do so, just send it to me.
	 )
	 Known infix operations are
	   +, -, *, /, ^ for add, sub, mul, div, pow
	 Each other operation is a prefix one that needs 
	 a (comma or colon seperated) list of subexpressions.
	 Exception: The unary prefix operation - is not known! 
	 (Use the function neg instead.)
	 Example 1:
	   With
	     \edef\result{11}
	   and
	     \FPeval\result{round(root(2,sin(result + 2.5)):2)}
	   or
	     \FPeval{result}{round(root(2,sin(result + 2.5)):2)}
	   \result becomes the value 0.90
	Example 2:
	  \FPeval\result{clip(2*3+5*6)}   results to 36
	  \FPeval\result{clip(2*(3+5)*6)} results to 96

KNOWN BUGS:
	- does not work with multido.sty/multido.tex
	  Reason: 
	    multido uses the same macro names \FPadd and \FPsub
	  Recommended Solution:
	    Patch multido.tex, i.e. apply the following substitutions:
	      FPadd -> mdo@FPadd
	      FPsub -> mdo@FPsub

        - incompatibility with french style of babel
	  this only affects macros using the colon (:)
	  Recommended Solution:
	    Load the fp-package before babel with french style
	  Other Possible Solution:
            Use \catcode`\:=12 after loading babel with french style

	- others:
	    Currently not known, but, though we do not, we could give
	    a warranty of their existence ...

HISTORY:
	Date		By			File		New Version
	
	Jan. 14, 2019	Peter Wang	documentation  V2.1d
	  improved documentation based on the original README.txt, with examples to show the syntax.
	
	Jan. 14, 2019	Enrico Gregorio	`fp-exp.sty' and `lfp.sty` V2.1d
	  Fixed two unprotected end-of-lines in the above files that can, under certain circumstances, add spaces in the output, causing unwanted drifting.

	Oct. 21, 1996	Michael Mehlich		fp-upn.sty	V2.1c
	  better debug messages (especially giving results of one step computations)

	May. 13, 1996   Michael Mehlich         fp-basic.sty    V1.2d
          \newcount and \countdef have interfered each other 
	  when the first newcount uses a counter number less 
	  than 60, the result has been wrong results when using 
	  the package with plain tex (a problem that has been 
	  reported by Ricardo Sanchez Carmenes)

        May. 13, 1996   Michael Mehlich         all files       -
	  problems with unwanted spaces removed
	  (bug reported by Ricardo Sanchez Carmenes)

	May. 28, 1995	Michael Mehlich		fp-basic.sty	V1.2c
	  modified \FPset and added \FPprint

	Apr. 27, 1995	Michael Mehliche	fp-trigo.sty	V0.9e
	  incorrect result of sine for 3/2pi fixed
	  (bug reported by Miroslav Balda)

	Apr. 14, 1995	Michael	Mehlich		fp-trigo.sty	V0.9d
	  infinite loop in computing sine and cosine fixed
	  (bug reported by Miroslav Balda)

	Apr. 05, 1995	Michael Mehlich		fp-snap.sty	V1.0a
	  rounding bug in FPround fixed
	  (bug reported by Miroslav Balda)

	Apr. 04, 1995	Michael Mehlich		fp.tex		-
						lfp.sty		-
	  a redefinition of \loop..\repeat added not to get into
	  trouble with its behaviour within my macros
	  (bug reported by Miroslav Balda)
		
	Apr. 04, 1995	Michael Mehlich		fp-basic.sty	V1.2b
	  added a value introduction command FPset

	Apr. 03, 1995	Michael Mehlich		fp-eqn.sty	V0.4
	  added solution algorithms for cubic and 4-th degree equations

	Apr. 03, 1995	Michael Mehlich		fp-trigo.sty	V0.9c
	  added some % at end of lines not to introduce unwanted spaces
	  removed some debug informations that have accidently been left in

	Apr. 03, 1995	Michael Mehlich		fp-exp.sty	V0.7e
	  added some % at end of lines not to introduce unwanted spaces

	Apr. 03, 1995	Michael Mehlich		fp-upn.sty	V2.1b
						fp-eval.sty	V0.9a
	  added support of sgn

	Apr. 03, 1995	Michael Mehlich		fp-basic.sty	V1.2a
	  added new command \FPsgn
	  
	Apr. 02, 1995	Michael Mehlich		fp-exp.sty	V0.7d
	  bug corrected, power of 0 by f # 0 now is 0 and no longer 
	  leads to an error message

	Apr. 02, 1995	Michael Mehlich		fp.sty		V0.8
	  added fp-eval.sty to list of required packages

	Apr. 02, 1995	Michael Mehlich		fp-upn.sty	V2.1a
	  some modifications to work with fp-eval.sty
	  
	Apr. 02, 1995	Michael Mehlich		fp-eval.sty	V0.9
	  inital version
	  
	Mar. 15, 1995   Michael Mehlich		fp.sty		V0.7a
	  added fp-addons.sty, fp-eqn.sty to list of required packages

	Mar. 15, 1995	Michael Mehlich		fp-eqn.sty	V0.2
	  initial version

	Mar. 15, 1995 	Michael Mehlich		fp-exp.sty	V0.7c
	  bug corrected, root of 0 now is 0 and no longer leads to
	  an error message

	Mar. 15, 1995	Michael Mehlich		fp-upn.sty	V2.1
	  allow macros to be given without \ and {} surrounding
	  support of min, max added

	Mar. 15, 1995	Michael Mehlich		fp-addons.sty	V0.1
	  initial version

	Feb. 23, 1995 	Denis Girou		fp-random.sty	V1.0a
	  more elaborated comments

	Feb. 21, 1995	Michael Mehlich		fp-trigo.sty	V0.9b
	  corrected overflow test for arcsin and arccos

	Feb. 18, 1995	Michael Mehlich		fp-upn.sty	V2.0
	  added debug messages for fp-upn.sty
	  (recommended by Denis Girou)

	Feb. 18, 1995	Michael Mehlich		fp.sty		V0.7
	  added fp-random.sty to list of required packages

	Feb. 18, 1995	Michael Mehlich		fp-basic.sty	V1.2
	  printing fp-messages is conditional only (default: true)
	  introduced macro for printing debug messages (default: do not print)
	  (recommmended by Denis Girou)

	Feb. 18, 1995	Michael Mehlich		fp-exp.sty	V0.7c
	  corrected bugs in \FP@pow and \FP@root writing messages to
	  ordinary text
	  (reported by Denis Girou)

	Feb. 17, 1995	Denis Girou		fp-random.sty	V1.0
	  introduced

	Feb. 17, 1995	Michael Mehlich		fp-basic.sty 	V1.1f
	  corrected \FP@strip introduced in version V1.1e
	  as it has to but did not hande + and -

	Feb. 17, 1995	Michael Mehlich		fp-basic.sty 	V1.1e
	  corrected \FP@strip introduced in version V1.1d
	  as it has to but did not hande empty parameters
	  
	Feb. 17, 1995	Michael Mehlich		fp-basic.sty	V1.1d
	  bug in scanning numbers by \FP@readvalue in connection
	  with number-macros of \FPupn corrected
	  (thanks for Denis Girou reporting this bug)

	Nov. 19, 1994	Michael Mehlich		fp.sty		V0.6
	  package date changed
	  
	Nov. 19, 1994	Michael Mehlich		fp-basic.sty	V1.1c
	  bug in \FP@correctintcounter corrected
	  
	Nov. 19, 1994	Michael Mehlich		fp-upn.sty	V1.1
	  handling of arctan, arccot, arctancot added

	Nov. 19, 1994	Michael Mehlich		fp-trigo.sty	V0.9a
	  \FParctan, \FParccot, \FParctancot added
	  
	Oct. 27, 1994 	Michael Mehlich		lfp.sty		-
	  introduced

	Oct. 27, 1994 	Michael Mehlich		fp.tex		-
	  introduced
	  
	Oct. 15, 1994 	Michael Mehlich		readme.fp	-
	  this history changed for better readability
	  
      	Oct. 15, 1994	Michael Mehlich		fp-exp.sty	V0.7b
	  subtraction bug in \FP@@exp corrected

     	Oct. 15, 1994	Michael Mehlich		fp-basic.sty	V1.1b
          subtraction in \FP@counttimes changed
     	
	Oct. 15, 1994	Michael Mehlich		fp-trigo.sty	V0.7b
          error message, if \FP@modtwopi does not lead to correct result
	  (this shouldn't be possible)
	  subtraction in \FP@@cos corrected

     	Oct. 12, 1994 	Michael Mehlich		fp.sty		V0.5b
          prevent files included from sending messages

	Oct. 12, 1994	Michael Mehlich		readme.fp	-
	  changed entry for defpattern.sty in this history to reflect
	  original source for defpattern.sty
	  
     	Oct. 12, 1994	Michael Mehlich		defpattern.sty	-
          source notice in message corrected
	 
     	Oct. 12, 1994 	Michael Mehlich 	fp-exp.sty	-
          start message for \FPpow changed

     	Oct. 12, 1994   Michael Mehlich	fp-trigo.sty		-
          unnecessary \typeout removed

     	Oct. 3, 1994 	Michael Mehlich, 	fp.sty		V0.5
          additional styles included by fp.sty

     	Oct. 3, 1994 	Michael Mehlich 	fp-upn.sty	V1.0
          first version

	Oct. 3, 1994 	Michael Mehlich 	defpattern.sty	-
          modification of the \howto-macro in TeX and TUG NEWS
	  from an article by Alan Jeffrey
	  no version number, no copyright (public domain)
	  TeX and TUG News 2(2) writes in the section "Mission Statement":
	    "The entire contents of this newsletter are being placed in
	     the public domain."

     	Oct. 3, 1994	Michael Mehlich		fp-basic.sty	V1.1
          bug in \FPadd corrected

     	Aug. 29, 1994	Michael Mehlich 	fp.sty		V0.3
          additional styles included by fp.sty

  	Aug. 29, 1994	Michael Mehlich	 	fp-trigo.sty	V0.7
          first version
	 
     	Aug. 29, 1994 	Michael Mehlich 	fp-pas.sty	V1.0
          first version
	 
     	Aug. 29, 1994 	Michael Mehlich 	fp-exp.sty	V0.7
          first version

     	Aug. 12, 1994	Michael Mehlich		fp.sty		V0.2
          first version

     	Aug. 10, 1994	Michael Mehlich		fp-snap.sty	V1.0
          first version
	 
  	Apr. 20, 1994	Michael Mehlich		fp-basic.sty	V1.0
          \FPabs added

  	Apr. 12, 1994	Michael Mehlich		fp-basic.sty	V0.99
          division algorithm added

  	Feb. 03, 1994	Michael Mehlich		fp-basic.sty	V0.8
          all macros are completely rewritten to be able to use an increased
	  range of numbers

     	Jan. 18, 1994	Michael Mehlich		fp-basic.sty	V0.2
          bug in \FP@store corrected

   	Jan. 17, 1994 	Michael Mehlich		fp-basic.sty	V0.1
          the file realcalc.tex V1.0, (C) Frank Buchholz has been renamed to
          fp-basic.sty V0.1 with all macros renamed, \@trunc removed

COPYING:
     - Permission to use, copy, modify, and distribute this software and its
       documentation for any purpose and without fee is hereby granted,
       provided that the above copyright notice, the above history with your
       modifications added, and this permission notice appear in all copies 
       and modified versions.
     - The copyright holder disclaim all warranties with regard to this
       software, including all implied warranties of merchantability and
       fitness, in no event shall the copyright holder be liable for any
       special, indirect or consequential damages or any damages whatsoever
       resulting from loss of use, data or profits, whether in an action of
       contract, negligence or other tortious action, arising out of or in
       connection with the use or performance of this software.
