# cjk-build.pl
#
# Public domain.
#
# Written by Werner Lemberg  <wl@gnu.org>
#
# This file is intended to be called from the `MAKEcjk' subroutine within
# the ctan2tds perl script.  It installs the necessary files from the CJK
# package into the correct destinations.
#
# It expects that the CJK packages (cjk-4.8.5 and cjk-4.8.5-doc) have been
# unpacked (unmodified) in the current directory.  For installation, it
# simply uses `install -d' so that missing subdirectories are created
# automatically.


# XXX: This installs files in the Build hierarchy!


my $B = "cjkutils/bat";
my $C = "cjkutils/conv";
my $H = "cjkutils/hbf2gf";
my $S = "cjkutils/scripts";


&I("utils/Bg5conv/bg5conv.c",   "$C/bg5conv.c");
&I("utils/Bg5conv/bg5latex",    "$S/bg5latex");
&I("utils/Bg5conv/bg5pdflatex", "$S/bg5pdflatex");

&I("utils/CEFconv/cef5conv.c",   "$C/cef5conv.c");
&I("utils/CEFconv/cef5latex",    "$S/cef5latex");
&I("utils/CEFconv/cef5pdflatex", "$S/cef5pdflatex");
&I("utils/CEFconv/cefconv.c",    "$C/cefconv.c");
&I("utils/CEFconv/ceflatex",     "$S/ceflatex");
&I("utils/CEFconv/cefpdflatex",  "$S/cefpdflatex");
&I("utils/CEFconv/cefsconv.c",   "$C/cefsconv.c");
&I("utils/CEFconv/cefslatex",    "$S/cefslatex");
&I("utils/CEFconv/cefspdflatex", "$S/cefspdflatex");

&I("utils/cjklatex/cjklatex.c", "$B/cjklatex.c");

# utils/extconv/bg5+latex       ---   # soft link to gbklatex
# utils/extconv/bg5+pdflatex    ---   # soft link to gbkpdflatex
&I("utils/extconv/extconv.c",   "$C/extconv.c");
&I("utils/extconv/gbklatex",    "$S/gbklatex");
&I("utils/extconv/gbkpdflatex", "$S/gbkpdflatex");

&I("utils/hbf2gf/configure.ac", "$H/configure.ac");
&I("utils/hbf2gf/emdir.c",      "$H/emdir.c");
&I("utils/hbf2gf/emdir.h",      "$H/emdir.h");
&I("utils/hbf2gf/emtexdir.c",   "$H/emtexdir.c");
&I("utils/hbf2gf/emtexdir.h",   "$H/emtexdir.h");
&I("utils/hbf2gf/hbf2gf.def",   "$H/hbf2gf.def");
&I("utils/hbf2gf/hbf2gf.w",     "$H/hbf2gf.w");
&I("utils/hbf2gf/hbf.c",        "$H/hbf.c");
&I("utils/hbf2gf/hbf.h",        "$H/hbf.h");

&I("utils/SJISconv/sjisconv.c",   "$C/sjisconv.c");
&I("utils/SJISconv/sjislatex",    "$S/sjislatex");
&I("utils/SJISconv/sjispdflatex", "$S/sjispdflatex");

1;
# EOF
