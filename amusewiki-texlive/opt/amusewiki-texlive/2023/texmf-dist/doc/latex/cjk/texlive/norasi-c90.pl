# norasi-c90.pl
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

my $D = "dvips/norasi-c90";
my $M = "fonts/map/dvips/norasi-c90";
my $S = "source/fonts/norasi-c90";
my $T = "fonts/tfm/public/norasi-c90";


&I("utils/thaifont/texmf/dvips/norasi-c90/config.norasi-c90", "$D/config.norasi-c90");

&I("utils/thaifont/texmf/fonts/map/dvips/norasi-c90/norasi-c90.map", "$M/norasi-c90.map");

&I("utils/thaifont/texmf/fonts/tfm/public/norasi-c90/ftnb8z.tfm",  "$T/ftnb8z.tfm");
&I("utils/thaifont/texmf/fonts/tfm/public/norasi-c90/ftnbi8z.tfm", "$T/ftnbi8z.tfm");
&I("utils/thaifont/texmf/fonts/tfm/public/norasi-c90/ftni8z.tfm",  "$T/ftni8z.tfm");
&I("utils/thaifont/texmf/fonts/tfm/public/norasi-c90/ftnr8z.tfm",  "$T/ftnr8z.tfm");

&I("utils/thaifont/tools/norasi-c90.fontinst", "$S/norasi-c90.fontinst");

1;
# EOF
