# bin-cjkutils.pl
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
# unpacked (unmodified) in the current directory.


# XXX: This installs files in `texmf', not `texmf-dist'!


my $D = "doc";
my $M = "doc/man/man1";
my $H = "hbf2gf";


#
# cjk-4.8.5
# ---------
#

&I("utils/Bg5conv/bg5conv.1", "$M/bg5conv.1");

&I("utils/CEFconv/cef5conv.1", "$M/cef5conv.1");
&I("utils/CEFconv/cefconv.1",  "$M/cefconv.1");
&I("utils/CEFconv/cefsconv.1", "$M/cefsconv.1");

&I("utils/extconv/extconv.1", "$M/extconv.1");

&I("utils/hbf2gf/hbf2gf.1", "$M/hbf2gf.1");

&I("utils/SJISconv/sjisconv.1", "$M/sjisconv.1");

&I("utils/hbf2gf/cfg/b5ka12.cfg", "$H/b5ka12.cfg");
&I("utils/hbf2gf/cfg/b5kr12.cfg", "$H/b5kr12.cfg");
&I("utils/hbf2gf/cfg/b5so12.cfg", "$H/b5so12.cfg");
&I("utils/hbf2gf/cfg/c1so12.cfg", "$H/c1so12.cfg");
&I("utils/hbf2gf/cfg/c2so12.cfg", "$H/c2so12.cfg");
&I("utils/hbf2gf/cfg/c3so12.cfg", "$H/c3so12.cfg");
&I("utils/hbf2gf/cfg/c4so12.cfg", "$H/c4so12.cfg");
&I("utils/hbf2gf/cfg/c5so12.cfg", "$H/c5so12.cfg");
&I("utils/hbf2gf/cfg/c6so12.cfg", "$H/c6so12.cfg");
&I("utils/hbf2gf/cfg/c7so12.cfg", "$H/c7so12.cfg");
&I("utils/hbf2gf/cfg/csso12.cfg", "$H/csso12.cfg");
&I("utils/hbf2gf/cfg/gsfs14.cfg", "$H/gsfs14.cfg");
&I("utils/hbf2gf/cfg/j2so12.cfg", "$H/j2so12.cfg");
&I("utils/hbf2gf/cfg/jsso12.cfg", "$H/jsso12.cfg");
&I("utils/hbf2gf/cfg/ksso17.cfg", "$H/ksso17.cfg");
&I("utils/hbf2gf/cfg/README",     "$H/README");


#
# cjk-4.8.5-doc
# -------------
#

# doc/dvi/bg5conv.dvi  ---
# doc/dvi/cef5conv.dvi ---
# doc/dvi/cefconv.dvi  ---
# doc/dvi/cefsconv.dvi ---
# doc/dvi/extconv.dvi  ---
# doc/dvi/hbf2gf.dvi   ---
# doc/dvi/sjisconv.dvi ---

# doc/man/dvi/bg5conv.dvi  ---
# doc/man/dvi/cef5conv.dvi ---
# doc/man/dvi/cefconv.dvi  ---
# doc/man/dvi/cefsconv.dvi ---
# doc/man/dvi/extconv.dvi  ---
# doc/man/dvi/hbf2gf.dvi   ---
# doc/man/dvi/sjisconv.dvi ---

# doc/man/html/bg5conv.html  ---
# doc/man/html/cef5conv.html ---
# doc/man/html/cefconv.html  ---
# doc/man/html/cefsconv.html ---
# doc/man/html/extconv.html  ---
# doc/man/html/hbf2gf.html   ---
# doc/man/html/sjisconv.html ---

# doc/man/pdf/bg5conv.pdf  ---
# doc/man/pdf/cef5conv.pdf ---
# doc/man/pdf/cefconv.pdf  ---
# doc/man/pdf/cefsconv.pdf ---
# doc/man/pdf/extconv.pdf  ---
# doc/man/pdf/hbf2gf.pdf   ---
# doc/man/pdf/sjisconv.pdf ---

# doc/man/txt/bg5conv.txt  ---
# doc/man/txt/cef5conv.txt ---
# doc/man/txt/cefconv.txt  ---
# doc/man/txt/cefsconv.txt ---
# doc/man/txt/extconv.txt  ---
# doc/man/txt/hbf2gf.txt   ---
# doc/man/txt/sjisconv.txt ---

&I("doc/pdf/bg5conv.pdf",  "$D/bg5conv/bg5conv.pdf");
&I("doc/pdf/cef5conv.pdf", "$D/cef5conv/cef5conv.pdf");
&I("doc/pdf/cefconv.pdf",  "$D/cefconv/cefconv.pdf");
&I("doc/pdf/cefsconv.pdf", "$D/cefsconv/cefsconv.pdf");
&I("doc/pdf/extconv.pdf",  "$D/extconv/extconv.pdf");
&I("doc/pdf/hbf2gf.pdf",   "$D/hbf2gf/hbf2gf.pdf");
&I("doc/pdf/sjisconv.pdf", "$D/sjisconv/sjisconv.pdf");

1;
# EOF
