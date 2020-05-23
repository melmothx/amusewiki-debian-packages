# $Id: xetex.pl 40301 2016-04-07 12:25:35Z siepo $
# post action for xetex to handle system font stuff.
# Copyright 2008, 2009, 2011 Norbert Preining
# This file is licensed under the GNU General Public License version 2
# or any later version.
#
# We create the fontconfig configuration file.  On Windows,
# we also run fc-cache to make the fonts available.
# http://www.tug.org/texlive/doc/texlive-en/texlive-en.html#xetexfontconfig

my $texdir;
my $mode;
my $skip_gen; # not used for (un)install

BEGIN {
  $^W = 1;
  $mode = lc($ARGV[0]);
  $texdir = $ARGV[1];
  $skip_gen = (defined $ARGV[2]) ? 1 : 0; # not used with normal installs
  # make Perl find our packages first:
  unshift (@INC, "$texdir/tlpkg");
}
use TeXLive::TLUtils qw(win32 mkdirhier conv_to_w32_path log info);

if ($mode eq 'install') {
  do_install();
} elsif ($mode eq 'remove') {
  do_remove();
} else {
  die("unknown mode: $mode\n");
}

sub do_remove {
  # do nothing
}

sub do_install {
  # fontconfig-related stuff.
  chomp( my $fcache = `kpsewhich -var-value=FC_CACHEDIR` ) ;
  chomp( my $fconf = `kpsewhich -var-value=FONTCONFIG_PATH` ) ;
  if (-r "$texdir/bin/win32/xetex.exe") {
    # we have installed w32, so put it into texmfsysvar.
    mkdirhier($fcache);
    mkdirhier($fconf);
    TeXLive::TLUtils::rmtree($fcache);
    TeXLive::TLUtils::rmtree($fconf);
    my @cpycmd = ();
    if (win32()) {
      push @cpycmd, "xcopy", "/e", "/i", "/q", "/y";
    } else {
      push @cpycmd, "cp", "-R";
    }
    
    # copy trees from install area.
    my $postxetex = "$texdir/tlpkg/tlpostcode/xetex";
    system(@cpycmd,
         (win32() ? conv_to_w32_path("$postxetex/conf") : "$postxetex/conf"),
         (win32() ? conv_to_w32_path($fconf) : $fconf));
    system(@cpycmd,
         (win32() ? conv_to_w32_path("$postxetex/cache") : "$postxetex/cache"),
         (win32() ? conv_to_w32_path($fcache) : $fcache));
 
    if (open(FONTSCONF, "<$texdir/tlpkg/tlpostcode/xetex/conf/fonts.conf")) {
      my @lines = <FONTSCONF>;
      close(FONTSCONF);
      if (open(FONTSCONF, ">$fconf/fonts.conf")) {
        my $winfontdir;
        if (win32()) {
          $winfontdir = $ENV{'SystemRoot'}.'/fonts';
          $winfontdir =~ s!\\!/!g;
        }
        foreach (@lines) {
          $_ =~ s!c:/Program Files/texlive/YYYY!$texdir!;
          $_ =~ s!c:/windows/fonts!$winfontdir! if win32();
          print FONTSCONF;
        }
        close(FONTSCONF);
      } else {
        warn("open(>$fconf/fonts.conf) failed: $!");
      }
    } else {
      warn("open($texdir/tlpkg/tlpostcode/xetex/conf/fonts.conf) failed: $!");
    }
  }
  if (win32() && !$skip_gen) {
    # call fc-cache but only when we install on w32!
    info("Running fc-cache -v -r\n");
    log( `fc-cache -v -r 2>&1` );  # run it, log output

  } else {
    # non-Windows: create texlive-fontconfig.conf file in $texmfsysvar.
    mkdirhier("$fconf/conf");
    if (!open(FONTSCONF, ">$fconf/texlive-fontconfig.conf")) {
      warn("open(>$fconf/texlive-fontconfig.conf): $!");
    } else {
      print FONTSCONF '<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
';
      for my $t (qw/opentype truetype type1/) {
        print FONTSCONF "  <dir>$texdir/texmf-dist/fonts/$t</dir>\n";
      }
      print FONTSCONF "</fontconfig>\n";
      close(FONTSCONF)
      || tlwarn("close($fconf/texlive-fontconfig.conf) failed: $!");
    }

    # cygwin specific warning
    # we don't have our platform name available ...
    chomp(my $un = `uname`);
    if ($un =~ m/cygwin/i) {
      if (! -r "/usr/bin/cygfontconfig-1.dll") {
        printf STDERR <<CYGWIN_XETEX;

XeTeX on Cygwin requires fontconfig.
Please run cygwin's setup program and install the fontconfig package.

CYGWIN_XETEX
      }
    }
  }
}

### Local Variables:
### perl-indent-level: 2
### tab-width: 2
### indent-tabs-mode: nil
### End:
# vim:set tabstop=2 expandtab: #
