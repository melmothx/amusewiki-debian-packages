# c90.pl
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

my $D = "doc/fonts/enc/c90";
my $S = "source/fonts/enc/c90";
my $T = "fonts/enc/dvips/c90";


&I("utils/thaifont/texmf/fonts/enc/dvips/thai/c90.enc", "$T/c90.enc");

&I("utils/thaifont/tools/c90.etx", "$S/c90.etx");
&I("utils/thaifont/tools/c90.mtx", "$S/c90.mtx");

# doc/dvi/c90.dvi     ---
&I("doc/pdf/c90.pdf", "$D/c90.pdf");

1;
# EOF
