# garuda-c90.pl
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

my $D = "dvips/garuda-c90";
my $M = "fonts/map/dvips/garuda-c90";
my $S = "source/fonts/garuda-c90";
my $T = "fonts/tfm/public/garuda-c90";


&I("utils/thaifont/texmf/dvips/garuda-c90/config.garuda-c90", "$D/config.garuda-c90");

&I("utils/thaifont/texmf/fonts/map/dvips/garuda-c90/garuda-c90.map", "$M/garuda-c90.map");

&I("utils/thaifont/texmf/fonts/tfm/public/garuda-c90/fgdb8z.tfm",  "$T/fgdb8z.tfm");
&I("utils/thaifont/texmf/fonts/tfm/public/garuda-c90/fgdbo8z.tfm", "$T/fgdbo8z.tfm");
&I("utils/thaifont/texmf/fonts/tfm/public/garuda-c90/fgdo8z.tfm",  "$T/fgdo8z.tfm");
&I("utils/thaifont/texmf/fonts/tfm/public/garuda-c90/fgdr8z.tfm",  "$T/fgdr8z.tfm");

&I("utils/thaifont/tools/garuda-c90.fontinst", "$S/garuda-c90.fontinst");

1;
# EOF
