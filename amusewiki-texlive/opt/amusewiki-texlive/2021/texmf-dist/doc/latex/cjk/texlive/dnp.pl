# dnp.pl
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


&I("contrib/wadalab/DNP.sfd", "fonts/sfd/dnp/DNP.sfd");

1;
# EOF
