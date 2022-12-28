# cjk.pl
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

#
# cjk-4.8.5
# ---------
#

my $D = "doc/latex/cjk";
my $S = "source/latex/cjk";
my $T = "tex/latex/cjk";


&I("ChangeLog", "$D/ChangeLog");
&I("Makefile",  "$D/Makefile");
&I("MANIFEST",  "$D/MANIFEST");
&I("README",    "$D/README");
&I("TODO",      "$D/TODO");

&I("contrib/wadalab/c42goth.fd",  "$T/contrib/wadalab/c42goth.fd");
&I("contrib/wadalab/c42goth.fdx", "$T/contrib/wadalab/c42goth.fdx");
&I("contrib/wadalab/c42maru.fd",  "$T/contrib/wadalab/c42maru.fd");
&I("contrib/wadalab/c42maru.fdx", "$T/contrib/wadalab/c42maru.fdx");
&I("contrib/wadalab/c42min.fd",   "$T/contrib/wadalab/c42min.fd");
&I("contrib/wadalab/c42min.fdx",  "$T/contrib/wadalab/c42min.fdx");
&I("contrib/wadalab/c52maru.fd",  "$T/contrib/wadalab/c52maru.fd");
&I("contrib/wadalab/c52maru.fdx", "$T/contrib/wadalab/c52maru.fdx");
&I("contrib/wadalab/c52min.fd",   "$T/contrib/wadalab/c52min.fd");
&I("contrib/wadalab/c52min.fdx",  "$T/contrib/wadalab/c52min.fdx");
&I("contrib/wadalab/c70goth.fd",  "$T/contrib/wadalab/c70goth.fd");
&I("contrib/wadalab/c70goth.fdx", "$T/contrib/wadalab/c70goth.fdx");
&I("contrib/wadalab/c70maru.fd",  "$T/contrib/wadalab/c70maru.fd");
&I("contrib/wadalab/c70maru.fdx", "$T/contrib/wadalab/c70maru.fdx");
&I("contrib/wadalab/c70min.fd",   "$T/contrib/wadalab/c70min.fd");
&I("contrib/wadalab/c70min.fdx",  "$T/contrib/wadalab/c70min.fdx");

&I("contrib/wadalab/fixwada",        "$S/contrib/wadalab/fixwada");
&I("contrib/wadalab/fixwada2.pl",    "$S/contrib/wadalab/fixwada2.pl");
&I("contrib/wadalab/makefont",       "$S/contrib/wadalab/makefont");
&I("contrib/wadalab/makeuniwada.pl", "$S/contrib/wadalab/makeuniwada.pl");
&I("contrib/wadalab/wadalab.map",    "$S/contrib/wadalab/wadalab.map");
&I("contrib/wadalab/wadalab.txt",    "$S/contrib/wadalab/wadalab.txt");

&I("doc/CEF.txt",      "$D/doc/CEF.txt");
&I("doc/cjk-enc.txt",  "$D/doc/cjk-enc.txt");
&I("doc/CJKnumb.txt",  "$D/doc/CJKnumb.txt");
&I("doc/CJKspace.txt", "$D/doc/CJKspace.txt");
&I("doc/CJK.txt",      "$D/doc/CJK.txt");
&I("doc/CJKutf8.txt",  "$D/doc/CJKutf8.txt");
&I("doc/commands.txt", "$D/doc/commands.txt");
&I("doc/COPYING",      "$D/doc/COPYING");
&I("doc/dvidrv.txt",   "$D/doc/dvidrv.txt");
&I("doc/fdxfiles.txt", "$D/doc/fdxfiles.txt");
&I("doc/fonts.txt",    "$D/doc/fonts.txt");
&I("doc/hbf2gf.txt",   "$D/doc/hbf2gf.txt");
&I("doc/history.2_5",  "$D/doc/history.2_5");
&I("doc/history.txt",  "$D/doc/history.txt");
&I("doc/INSTALL",      "$D/doc/INSTALL");
&I("doc/pinyin.txt",   "$D/doc/pinyin.txt");
&I("doc/pyhyphen.txt", "$D/doc/pyhyphen.txt");
&I("doc/reftex.txt",   "$D/doc/reftex.txt");
&I("doc/ruby.txt",     "$D/doc/ruby.txt");
&I("doc/TDS.txt",      "$D/doc/TDS.txt");
&I("doc/thaifont.txt", "$D/doc/thaifont.txt");
&I("doc/vertical.txt", "$D/doc/vertical.txt");

&I("doc/chinese/emTeXb5.txt",  "$D/doc/chinese/emTeXb5.txt");
&I("doc/chinese/README",       "$D/doc/chinese/README");
&I("doc/chinese/READMEb5.tex", "$D/doc/chinese/READMEb5.tex");
&I("doc/chinese/READMEgb.tex", "$D/doc/chinese/READMEgb.tex");
&I("doc/chinese/teTeXb5.txt",  "$D/doc/chinese/teTeXb5.txt");

&I("doc/japanese/ascii.txt",    "$D/doc/japanese/ascii.txt");
&I("doc/japanese/japanese.jis", "$D/doc/japanese/japanese.jis");
&I("doc/japanese/japanese.txt", "$D/doc/japanese/japanese.txt");
&I("doc/japanese/jp-fonts.txt", "$D/doc/japanese/jp-fonts.txt");
&I("doc/japanese/jp-tex.txt",   "$D/doc/japanese/jp-tex.txt");
&I("doc/japanese/preview.txt",  "$D/doc/japanese/preview.txt");
&I("doc/japanese/README",       "$D/doc/japanese/README");
&I("doc/japanese/shibuaki.txt", "$D/doc/japanese/shibuaki.txt");

&I("doc/pdfhowto/examples/bkai.map",                 "$D/doc/pdfhowto/examples/bkai.map");
&I("doc/pdfhowto/examples/cid-x.map",                "$D/doc/pdfhowto/examples/cid-x.map");
&I("doc/pdfhowto/examples/cwtb.map",                 "$D/doc/pdfhowto/examples/cwtb.map");
&I("doc/pdfhowto/examples/dvipdfmx.cfg",             "$D/doc/pdfhowto/examples/dvipdfmx.cfg");
&I("doc/pdfhowto/examples/gen-map.pl",               "$D/doc/pdfhowto/examples/gen-map.pl");
&I("doc/pdfhowto/examples/map.list",                 "$D/doc/pdfhowto/examples/map.list");
&I("doc/pdfhowto/examples/texinput/Bg5/c00cwtb.fd",  "$D/doc/pdfhowto/examples/texinput/Bg5/c00cwtb.fd");
&I("doc/pdfhowto/examples/texinput/Bg5/c00tmpl.fd",  "$D/doc/pdfhowto/examples/texinput/Bg5/c00tmpl.fd");
&I("doc/pdfhowto/examples/texinput/GB/c10tmpl.fd",   "$D/doc/pdfhowto/examples/texinput/GB/c10tmpl.fd");
&I("doc/pdfhowto/examples/texinput/JIS/c40tmpl.fd",  "$D/doc/pdfhowto/examples/texinput/JIS/c40tmpl.fd");
&I("doc/pdfhowto/examples/texinput/SJIS/c49tmpl.fd", "$D/doc/pdfhowto/examples/texinput/SJIS/c49tmpl.fd");
&I("doc/pdfhowto/examples/updmap.my",                "$D/doc/pdfhowto/examples/updmap.my");
&I("doc/pdfhowto/examples/wcl.sfd",                  "$D/doc/pdfhowto/examples/wcl.sfd");
&I("doc/pdfhowto/HOWTO.txt",                         "$D/doc/pdfhowto/HOWTO.txt");

&I("examples/Big5.tex",     "$D/examples/Big5.tex");
&I("examples/Big5vert.tex", "$D/examples/Big5vert.tex");
&I("examples/CEF_test.tex", "$D/examples/CEF_test.tex");
&I("examples/CJKbabel.tex", "$D/examples/CJKbabel.tex");
&I("examples/CJKfntef.tex", "$D/examples/CJKfntef.tex");
&I("examples/CJKmixed.tex", "$D/examples/CJKmixed.tex");
&I("examples/CJKspace.tex", "$D/examples/CJKspace.tex");
&I("examples/CJKutf8.tex",  "$D/examples/CJKutf8.tex");
&I("examples/GB.tex",       "$D/examples/GB.tex");
&I("examples/JIS.tex",      "$D/examples/JIS.tex");
&I("examples/KS.tex",       "$D/examples/KS.tex");
&I("examples/muletest.tex", "$D/examples/muletest.tex");
&I("examples/py_test.tex",  "$D/examples/py_test.tex");
&I("examples/README",       "$D/examples/README");
&I("examples/rubytest.tex", "$D/examples/rubytest.tex");
&I("examples/SJIS.tex",     "$D/examples/SJIS.tex");
&I("examples/thai.tex",     "$D/examples/thai.tex");
&I("examples/thai_utf8.tex","$D/examples/thai_utf8.tex");
&I("examples/UTF8.tex",     "$D/examples/UTF8.tex");

&I("texinput/CJK.enc",      "$T/texinput/CJK.enc");
&I("texinput/CJKfntef.sty", "$T/texinput/CJKfntef.sty");
&I("texinput/CJKnumb.sty",  "$T/texinput/CJKnumb.sty");
&I("texinput/CJKspace.sty", "$T/texinput/CJKspace.sty");
&I("texinput/CJK.sty",      "$T/texinput/CJK.sty");
&I("texinput/CJKulem.sty",  "$T/texinput/CJKulem.sty");
&I("texinput/CJKutf8.sty",  "$T/texinput/CJKutf8.sty");
&I("texinput/CJKvert.sty",  "$T/texinput/CJKvert.sty");
&I("texinput/extended.chr", "$T/texinput/extended.chr");
&I("texinput/extended.enc", "$T/texinput/extended.enc");
&I("texinput/pinyin.sty",   "$T/texinput/pinyin.sty");
&I("texinput/pmCbig.enc",   "$T/texinput/pmCbig.enc");
&I("texinput/pmC.chr",      "$T/texinput/pmC.chr");
&I("texinput/pmCsmall.enc", "$T/texinput/pmCsmall.enc");
&I("texinput/ruby.sty",     "$T/texinput/ruby.sty");
&I("texinput/standard.bdg", "$T/texinput/standard.bdg");
&I("texinput/standard.chr", "$T/texinput/standard.chr");
&I("texinput/standard.enc", "$T/texinput/standard.enc");

&I("texinput/Bg5/Bg5.cap",      "$T/texinput/Bg5/Bg5.cap");
&I("texinput/Bg5/Bg5.chr",      "$T/texinput/Bg5/Bg5.chr");
&I("texinput/Bg5/Bg5.cpx",      "$T/texinput/Bg5/Bg5.cpx");
&I("texinput/Bg5/Bg5.enc",      "$T/texinput/Bg5/Bg5.enc");
&I("texinput/Bg5/c00bkai.fd",   "$T/texinput/Bg5/c00bkai.fd");
&I("texinput/Bg5/c00bkai.fdx",  "$T/texinput/Bg5/c00bkai.fdx");
&I("texinput/Bg5/c00bsmi.fd",   "$T/texinput/Bg5/c00bsmi.fd");
&I("texinput/Bg5/c00bsmi.fdx",  "$T/texinput/Bg5/c00bsmi.fdx");
&I("texinput/Bg5/c00bsmir.fd",  "$T/texinput/Bg5/c00bsmir.fd");
&I("texinput/Bg5/c00bsmir.fdx", "$T/texinput/Bg5/c00bsmir.fdx");
&I("texinput/Bg5/c00cns.fd",    "$T/texinput/Bg5/c00cns.fd");
&I("texinput/Bg5/c00fs.fd",     "$T/texinput/Bg5/c00fs.fd");
&I("texinput/Bg5/c00kai.fd",    "$T/texinput/Bg5/c00kai.fd");
&I("texinput/Bg5/c00kair.fd",   "$T/texinput/Bg5/c00kair.fd");
&I("texinput/Bg5/c00kair.fdx",  "$T/texinput/Bg5/c00kair.fdx");
&I("texinput/Bg5/c00song.fd",   "$T/texinput/Bg5/c00song.fd");
&I("texinput/Bg5/c01song.fd",   "$T/texinput/Bg5/c01song.fd");
&I("texinput/Bg5/c05song.fd",   "$T/texinput/Bg5/c05song.fd");
&I("texinput/Bg5/c09song.fd",   "$T/texinput/Bg5/c09song.fd");
&I("texinput/Bg5/HK.enc",       "$T/texinput/Bg5/HK.enc");

&I("texinput/CEF/c80song.fd", "$T/texinput/CEF/c80song.fd");
&I("texinput/CEF/c81song.fd", "$T/texinput/CEF/c81song.fd");

&I("texinput/CNS/c31song.fd", "$T/texinput/CNS/c31song.fd");
&I("texinput/CNS/c32song.fd", "$T/texinput/CNS/c32song.fd");
&I("texinput/CNS/c33song.fd", "$T/texinput/CNS/c33song.fd");
&I("texinput/CNS/c34song.fd", "$T/texinput/CNS/c34song.fd");
&I("texinput/CNS/c35song.fd", "$T/texinput/CNS/c35song.fd");
&I("texinput/CNS/c36song.fd", "$T/texinput/CNS/c36song.fd");
&I("texinput/CNS/c37song.fd", "$T/texinput/CNS/c37song.fd");
&I("texinput/CNS/EUC-TW.bdg", "$T/texinput/CNS/EUC-TW.bdg");
&I("texinput/CNS/EUC-TW.chr", "$T/texinput/CNS/EUC-TW.chr");
&I("texinput/CNS/EUC-TW.enc", "$T/texinput/CNS/EUC-TW.enc");

&I("texinput/GB/c10fs.fd",    "$T/texinput/GB/c10fs.fd");
&I("texinput/GB/c10gbsn.fd",  "$T/texinput/GB/c10gbsn.fd");
&I("texinput/GB/c10gbsn.fdx", "$T/texinput/GB/c10gbsn.fdx");
&I("texinput/GB/c10gkai.fd",  "$T/texinput/GB/c10gkai.fd");
&I("texinput/GB/c10gkai.fdx", "$T/texinput/GB/c10gkai.fdx");
&I("texinput/GB/c10song.fd",  "$T/texinput/GB/c10song.fd");
&I("texinput/GB/c11song.fd",  "$T/texinput/GB/c11song.fd");
&I("texinput/GB/c19song.fd",  "$T/texinput/GB/c19song.fd");
&I("texinput/GB/c20song.fd",  "$T/texinput/GB/c20song.fd");
&I("texinput/GB/c21song.fd",  "$T/texinput/GB/c21song.fd");
&I("texinput/GB/GB.cap",      "$T/texinput/GB/GB.cap");
&I("texinput/GB/GB.cpx",      "$T/texinput/GB/GB.cpx");

&I("texinput/JIS/c40song.fd",    "$T/texinput/JIS/c40song.fd");
&I("texinput/JIS/c41song.fd",    "$T/texinput/JIS/c41song.fd");
&I("texinput/JIS/c42song.fd",    "$T/texinput/JIS/c42song.fd");
&I("texinput/JIS/c43song.fd",    "$T/texinput/JIS/c43song.fd");
&I("texinput/JIS/c50song.fd",    "$T/texinput/JIS/c50song.fd");
&I("texinput/JIS/EUC-JP.bdg",    "$T/texinput/JIS/EUC-JP.bdg");
&I("texinput/JIS/EUC-JP.chr",    "$T/texinput/JIS/EUC-JP.chr");
&I("texinput/JIS/EUC-JP.enc",    "$T/texinput/JIS/EUC-JP.enc");
&I("texinput/JIS/EUC-JPdnp.enc", "$T/texinput/JIS/EUC-JPdnp.enc");
&I("texinput/JIS/JIS.cap",       "$T/texinput/JIS/JIS.cap");
&I("texinput/JIS/JIS.cpx",       "$T/texinput/JIS/JIS.cpx");
&I("texinput/JIS/JISdnp.enc",    "$T/texinput/JIS/JISdnp.enc");

&I("texinput/KS/c60dr.fd",    "$T/texinput/KS/c60dr.fd");
&I("texinput/KS/c60gr.fd",    "$T/texinput/KS/c60gr.fd");
&I("texinput/KS/c60gs.fd",    "$T/texinput/KS/c60gs.fd");
&I("texinput/KS/c60gt.fd",    "$T/texinput/KS/c60gt.fd");
&I("texinput/KS/c60hgt.fd",   "$T/texinput/KS/c60hgt.fd");
&I("texinput/KS/c60hmj.fd",   "$T/texinput/KS/c60hmj.fd");
&I("texinput/KS/c60hol.fd",   "$T/texinput/KS/c60hol.fd");
&I("texinput/KS/c60hpg.fd",   "$T/texinput/KS/c60hpg.fd");
&I("texinput/KS/c60mj.fd",    "$T/texinput/KS/c60mj.fd");
&I("texinput/KS/c61dr.fd",    "$T/texinput/KS/c61dr.fd");
&I("texinput/KS/c61gr.fd",    "$T/texinput/KS/c61gr.fd");
&I("texinput/KS/c61gs.fd",    "$T/texinput/KS/c61gs.fd");
&I("texinput/KS/c61gt.fd",    "$T/texinput/KS/c61gt.fd");
&I("texinput/KS/c61hgt.fd",   "$T/texinput/KS/c61hgt.fd");
&I("texinput/KS/c61hmj.fd",   "$T/texinput/KS/c61hmj.fd");
&I("texinput/KS/c61hol.fd",   "$T/texinput/KS/c61hol.fd");
&I("texinput/KS/c61hpg.fd",   "$T/texinput/KS/c61hpg.fd");
&I("texinput/KS/c61mj.fd",    "$T/texinput/KS/c61mj.fd");
&I("texinput/KS/c62song.fd",  "$T/texinput/KS/c62song.fd");
&I("texinput/KS/hangul2.cap", "$T/texinput/KS/hangul2.cap");
&I("texinput/KS/hangul2.cpx", "$T/texinput/KS/hangul2.cpx");
&I("texinput/KS/hangul.cap",  "$T/texinput/KS/hangul.cap");
&I("texinput/KS/hangul.cpx",  "$T/texinput/KS/hangul.cpx");
&I("texinput/KS/hanja.cap",   "$T/texinput/KS/hanja.cap");
&I("texinput/KS/hanja.cpx",   "$T/texinput/KS/hanja.cpx");
&I("texinput/KS/KS.chr",      "$T/texinput/KS/KS.chr");
&I("texinput/KS/KS.enc",      "$T/texinput/KS/KS.enc");

&I("texinput/KS/HLaTeX/c63bm.fd",   "$T/texinput/KS/HLaTeX/c63bm.fd");
&I("texinput/KS/HLaTeX/c63dn.fd",   "$T/texinput/KS/HLaTeX/c63dn.fd");
&I("texinput/KS/HLaTeX/c63gr.fd",   "$T/texinput/KS/HLaTeX/c63gr.fd");
&I("texinput/KS/HLaTeX/c63gs.fd",   "$T/texinput/KS/HLaTeX/c63gs.fd");
&I("texinput/KS/HLaTeX/c63gt.fd",   "$T/texinput/KS/HLaTeX/c63gt.fd");
&I("texinput/KS/HLaTeX/c63jgt.fd",  "$T/texinput/KS/HLaTeX/c63jgt.fd");
&I("texinput/KS/HLaTeX/c63jmj.fd",  "$T/texinput/KS/HLaTeX/c63jmj.fd");
&I("texinput/KS/HLaTeX/c63jnv.fd",  "$T/texinput/KS/HLaTeX/c63jnv.fd");
&I("texinput/KS/HLaTeX/c63jsr.fd",  "$T/texinput/KS/HLaTeX/c63jsr.fd");
&I("texinput/KS/HLaTeX/c63mj.fd",   "$S/texinput/KS/HLaTeX/c63mj.fd");   # $S
&I("texinput/KS/HLaTeX/c63pga.fd",  "$T/texinput/KS/HLaTeX/c63pga.fd");
&I("texinput/KS/HLaTeX/c63pg.fd",   "$T/texinput/KS/HLaTeX/c63pg.fd");
&I("texinput/KS/HLaTeX/c63ph.fd",   "$T/texinput/KS/HLaTeX/c63ph.fd");
&I("texinput/KS/HLaTeX/c63pn.fd",   "$T/texinput/KS/HLaTeX/c63pn.fd");
&I("texinput/KS/HLaTeX/c63sh.fd",   "$T/texinput/KS/HLaTeX/c63sh.fd");
&I("texinput/KS/HLaTeX/c63tz.fd",   "$T/texinput/KS/HLaTeX/c63tz.fd");
&I("texinput/KS/HLaTeX/c63vd.fd",   "$T/texinput/KS/HLaTeX/c63vd.fd");
&I("texinput/KS/HLaTeX/c63yt.fd",   "$T/texinput/KS/HLaTeX/c63yt.fd");
&I("texinput/KS/HLaTeX/c64bm.fd",   "$T/texinput/KS/HLaTeX/c64bm.fd");
&I("texinput/KS/HLaTeX/c64dn.fd",   "$T/texinput/KS/HLaTeX/c64dn.fd");
&I("texinput/KS/HLaTeX/c64gr.fd",   "$T/texinput/KS/HLaTeX/c64gr.fd");
&I("texinput/KS/HLaTeX/c64gs.fd",   "$T/texinput/KS/HLaTeX/c64gs.fd");
&I("texinput/KS/HLaTeX/c64gt.fd",   "$T/texinput/KS/HLaTeX/c64gt.fd");
&I("texinput/KS/HLaTeX/c64jgt.fd",  "$T/texinput/KS/HLaTeX/c64jgt.fd");
&I("texinput/KS/HLaTeX/c64jmj.fd",  "$T/texinput/KS/HLaTeX/c64jmj.fd");
&I("texinput/KS/HLaTeX/c64jnv.fd",  "$T/texinput/KS/HLaTeX/c64jnv.fd");
&I("texinput/KS/HLaTeX/c64jsr.fd",  "$T/texinput/KS/HLaTeX/c64jsr.fd");
&I("texinput/KS/HLaTeX/c64mj.fd",   "$S/texinput/KS/HLaTeX/c64mj.fd");   # $S
&I("texinput/KS/HLaTeX/c64pga.fd",  "$T/texinput/KS/HLaTeX/c64pga.fd");
&I("texinput/KS/HLaTeX/c64pg.fd",   "$T/texinput/KS/HLaTeX/c64pg.fd");
&I("texinput/KS/HLaTeX/c64ph.fd",   "$T/texinput/KS/HLaTeX/c64ph.fd");
&I("texinput/KS/HLaTeX/c64pn.fd",   "$T/texinput/KS/HLaTeX/c64pn.fd");
&I("texinput/KS/HLaTeX/c64sh.fd",   "$T/texinput/KS/HLaTeX/c64sh.fd");
&I("texinput/KS/HLaTeX/c64tz.fd",   "$T/texinput/KS/HLaTeX/c64tz.fd");
&I("texinput/KS/HLaTeX/c64vd.fd",   "$T/texinput/KS/HLaTeX/c64vd.fd");
&I("texinput/KS/HLaTeX/c64yt.fd",   "$T/texinput/KS/HLaTeX/c64yt.fd");
&I("texinput/KS/HLaTeX/c65bm.fd",   "$T/texinput/KS/HLaTeX/c65bm.fd");
&I("texinput/KS/HLaTeX/c65dn.fd",   "$T/texinput/KS/HLaTeX/c65dn.fd");
&I("texinput/KS/HLaTeX/c65gr.fd",   "$T/texinput/KS/HLaTeX/c65gr.fd");
&I("texinput/KS/HLaTeX/c65gs.fd",   "$T/texinput/KS/HLaTeX/c65gs.fd");
&I("texinput/KS/HLaTeX/c65gt.fd",   "$T/texinput/KS/HLaTeX/c65gt.fd");
&I("texinput/KS/HLaTeX/c65jgt.fd",  "$T/texinput/KS/HLaTeX/c65jgt.fd");
&I("texinput/KS/HLaTeX/c65jmj.fd",  "$T/texinput/KS/HLaTeX/c65jmj.fd");
&I("texinput/KS/HLaTeX/c65jnv.fd",  "$T/texinput/KS/HLaTeX/c65jnv.fd");
&I("texinput/KS/HLaTeX/c65jsr.fd",  "$T/texinput/KS/HLaTeX/c65jsr.fd");
&I("texinput/KS/HLaTeX/c65mj.fd",   "$S/texinput/KS/HLaTeX/c65mj.fd");   # $S
&I("texinput/KS/HLaTeX/c65pga.fd",  "$T/texinput/KS/HLaTeX/c65pga.fd");
&I("texinput/KS/HLaTeX/c65pg.fd",   "$T/texinput/KS/HLaTeX/c65pg.fd");
&I("texinput/KS/HLaTeX/c65ph.fd",   "$T/texinput/KS/HLaTeX/c65ph.fd");
&I("texinput/KS/HLaTeX/c65pn.fd",   "$T/texinput/KS/HLaTeX/c65pn.fd");
&I("texinput/KS/HLaTeX/c65sh.fd",   "$T/texinput/KS/HLaTeX/c65sh.fd");
&I("texinput/KS/HLaTeX/c65tz.fd",   "$T/texinput/KS/HLaTeX/c65tz.fd");
&I("texinput/KS/HLaTeX/c65vd.fd",   "$T/texinput/KS/HLaTeX/c65vd.fd");
&I("texinput/KS/HLaTeX/c65yt.fd",   "$T/texinput/KS/HLaTeX/c65yt.fd");
&I("texinput/KS/HLaTeX/HLaTeX.chr", "$T/texinput/KS/HLaTeX/HLaTeX.chr");
&I("texinput/KS/HLaTeX/KSHL.enc",   "$T/texinput/KS/HLaTeX/KSHL.enc");
&I("texinput/KS/HLaTeX/pshan.sty",  "$T/texinput/KS/HLaTeX/pshan.sty");

&I("texinput/mule/MULEenc.sty", "$T/texinput/mule/MULEenc.sty");

&I("texinput/SJIS/c49song.fd",  "$T/texinput/SJIS/c49song.fd");
&I("texinput/SJIS/SJIS.bdg",    "$T/texinput/SJIS/SJIS.bdg");
&I("texinput/SJIS/SJIS.cap",    "$T/texinput/SJIS/SJIS.cap");
&I("texinput/SJIS/SJIS.chr",    "$T/texinput/SJIS/SJIS.chr");
&I("texinput/SJIS/SJIS.cpx",    "$T/texinput/SJIS/SJIS.cpx");
&I("texinput/SJIS/SJISdnp.chr", "$T/texinput/SJIS/SJISdnp.chr");
&I("texinput/SJIS/SJISdnp.enc", "$T/texinput/SJIS/SJISdnp.enc");
&I("texinput/SJIS/SJIS.enc",    "$T/texinput/SJIS/SJIS.enc");

&I("texinput/thai/c90cmr.fd",   "$T/texinput/thai/c90cmr.fd");
&I("texinput/thai/c90cmss.fd",  "$T/texinput/thai/c90cmss.fd");
&I("texinput/thai/c90cmtt.fd",  "$T/texinput/thai/c90cmtt.fd");
&I("texinput/thai/c90enc.def",  "$T/texinput/thai/c90enc.def");
&I("texinput/thai/c90gar.fd",   "$T/texinput/thai/c90gar.fd");
&I("texinput/thai/c90nrsr.fd",  "$T/texinput/thai/c90nrsr.fd");
&I("texinput/thai/thaicjk.ldf", "$T/texinput/thai/thaicjk.ldf");

&I("texinput/UTF8/c70bkai.fd",   "$T/texinput/UTF8/c70bkai.fd");
&I("texinput/UTF8/c70bkai.fdx",  "$T/texinput/UTF8/c70bkai.fdx");
&I("texinput/UTF8/c70bsmi.fd",   "$T/texinput/UTF8/c70bsmi.fd");
&I("texinput/UTF8/c70bsmi.fdx",  "$T/texinput/UTF8/c70bsmi.fdx");
&I("texinput/UTF8/c70gbsn.fd",   "$T/texinput/UTF8/c70gbsn.fd");
&I("texinput/UTF8/c70gbsn.fdx",  "$T/texinput/UTF8/c70gbsn.fdx");
&I("texinput/UTF8/c70gkai.fd",   "$T/texinput/UTF8/c70gkai.fd");
&I("texinput/UTF8/c70gkai.fdx",  "$T/texinput/UTF8/c70gkai.fdx");
&I("texinput/UTF8/c70mj.fd",     "$T/texinput/UTF8/c70mj.fd");
&I("texinput/UTF8/c70mj.fdx",    "$T/texinput/UTF8/c70mj.fdx");
&I("texinput/UTF8/c70song.fd",   "$T/texinput/UTF8/c70song.fd");
&I("texinput/UTF8/ja.cpx",       "$T/texinput/UTF8/ja.cpx");
&I("texinput/UTF8/ko-Hang2.cpx", "$T/texinput/UTF8/ko-Hang2.cpx");
&I("texinput/UTF8/ko-Hang.cpx",  "$T/texinput/UTF8/ko-Hang.cpx");
&I("texinput/UTF8/ko-Hani.cpx",  "$T/texinput/UTF8/ko-Hani.cpx");
&I("texinput/UTF8/UTF8.bdg",     "$T/texinput/UTF8/UTF8.bdg");
&I("texinput/UTF8/UTF8.chr",     "$T/texinput/UTF8/UTF8.chr");
&I("texinput/UTF8/UTF8.enc",     "$T/texinput/UTF8/UTF8.enc");
&I("texinput/UTF8/zh-Hans.cpx",  "$T/texinput/UTF8/zh-Hans.cpx");
&I("texinput/UTF8/zh-Hant.cpx",  "$T/texinput/UTF8/zh-Hant.cpx");

&I("texlive/c63mj.fd", "$T/texinput/KS/HLaTeX/c63mj.fd");
&I("texlive/c64mj.fd", "$T/texinput/KS/HLaTeX/c64mj.fd");
&I("texlive/c65mj.fd", "$T/texinput/KS/HLaTeX/c65mj.fd");
# texlive/README       ---
&I("texlive/bin-cjkutils.pl", "$D/texlive/bin-cjkutils.pl");
&I("texlive/c90.pl",          "$D/texlive/c90.pl");
&I("texlive/cjk-build.pl",    "$D/texlive/cjk-build.pl");
&I("texlive/cjk.pl",          "$D/texlive/cjk.pl");
&I("texlive/dnp.pl",          "$D/texlive/dnp.pl");
&I("texlive/garuda-c90.pl",   "$D/texlive/garuda-c90.pl");
&I("texlive/norasi-c90.pl",   "$D/texlive/norasi-c90.pl");
              
&I("utils/f_name.bat", "$S/utils/f_name.bat");

&I("utils/Bg5conv/bg5conv.w",    "$S/utils/Bg5conv/bg5conv.w");
&I("utils/Bg5conv/bg5latex.bat", "$S/utils/Bg5conv/bg5latex.bat");
&I("utils/Bg5conv/bg5latex.cmd", "$S/utils/Bg5conv/bg5latex.cmd");

&I("utils/CEFconv/cef5conv.w",   "$S/utils/CEFconv/cef5conv.w");
&I("utils/CEFconv/cef5ltx.bat",  "$S/utils/CEFconv/cef5ltx.bat");
&I("utils/CEFconv/cef5ltx.cmd",  "$S/utils/CEFconv/cef5ltx.cmd");
&I("utils/CEFconv/cefconv.w",    "$S/utils/CEFconv/cefconv.w");
&I("utils/CEFconv/ceflatex.bat", "$S/utils/CEFconv/ceflatex.bat");
&I("utils/CEFconv/ceflatex.cmd", "$S/utils/CEFconv/ceflatex.cmd");
&I("utils/CEFconv/cefsconv.w",   "$S/utils/CEFconv/cefsconv.w");
&I("utils/CEFconv/cefsltx.bat",  "$S/utils/CEFconv/cefsltx.bat");
&I("utils/CEFconv/cefsltx.cmd",  "$S/utils/CEFconv/cefsltx.cmd");

&I("utils/extconv/bg5pltx.bat",  "$S/utils/extconv/bg5pltx.bat");
&I("utils/extconv/bg5pltx.cmd",  "$S/utils/extconv/bg5pltx.cmd");
&I("utils/extconv/extconv.w",    "$S/utils/extconv/extconv.w");
&I("utils/extconv/gbklatex.bat", "$S/utils/extconv/gbklatex.bat");
&I("utils/extconv/gbklatex.cmd", "$S/utils/extconv/gbklatex.cmd");

&I("utils/hbf2gf/c-auto.h",     "$S/utils/hbf2gf/c-auto.h");
# utils/hbf2gf/config.guess     ---
# utils/hbf2gf/config.sub       ---
# utils/hbf2gf/configure        ---
&I("utils/hbf2gf/dvidrv.btm",   "$S/utils/hbf2gf/dvidrv.btm");
# utils/hbf2gf/hbf2gf.c         ---
# utils/hbf2gf/install-sh       ---
&I("utils/hbf2gf/Makefile.gnu", "$S/utils/hbf2gf/Makefile.gnu");
&I("utils/hbf2gf/Makefile.in",  "$S/utils/hbf2gf/Makefile.in");
# utils/hbf2gf/mkinstalldirs    ---
&I("utils/hbf2gf/README",       "$S/utils/hbf2gf/README");

# utils/hbf2gf/scripts/teTeX-0.4/MakeTeXPK.diff  ---
# utils/hbf2gf/scripts/teTeX-0.4/MakeTeXTFM.diff ---
# utils/hbf2gf/scripts/web2c-6.1/MakeTeXPK.diff  ---
# utils/hbf2gf/scripts/web2c-6.1/README          ---
# utils/hbf2gf/scripts/web2c-7.0/MakeTeXPK.diff  ---
# utils/hbf2gf/scripts/web2c-7.0/MakeTeXTFM.diff ---
# utils/hbf2gf/scripts/web2c-7.1/MakeTeXPK.diff  ---
# utils/hbf2gf/scripts/web2c-7.1/MakeTeXTFM.diff ---
# utils/hbf2gf/scripts/web2c-7.2/mktexpk.diff    ---
# utils/hbf2gf/scripts/web2c-7.2/mktextfm.diff   ---

&I("utils/lisp/cjkspace.el", "$S/utils/lisp/cjkspace.el");
&I("utils/lisp/cjktilde.el", "$S/utils/lisp/cjktilde.el");

&I("utils/lisp/emacs/cjk-enc.el",   "$S/utils/lisp/emacs/cjk-enc.el");
&I("utils/lisp/emacs/thai-word.el", "$S/utils/lisp/emacs/thai-word.el");

&I("utils/lisp/mule-2.3/cjk-enc.el", "$S/utils/lisp/mule-2.3/cjk-enc.el");

&I("utils/pyhyphen/GNUmakefile",                 "$S/utils/pyhyphen/GNUmakefile");
&I("utils/pyhyphen/hyph-zh-latn-pinyin.in",      "$S/utils/pyhyphen/hyph-zh-latn-pinyin.in");
&I("utils/pyhyphen/hyph-zh-latn-pinyin.tex",     "$S/utils/pyhyphen/hyph-zh-latn-pinyin.tex");
&I("utils/pyhyphen/hyph-zh-latn-tonepinyin.tex", "$S/utils/pyhyphen/hyph-zh-latn-tonepinyin.tex");
&I("utils/pyhyphen/make-patterns.sh",            "$S/utils/pyhyphen/make-patterns.sh");
&I("utils/pyhyphen/pinyin.c",                    "$S/utils/pyhyphen/pinyin.c");
&I("utils/pyhyphen/pinyin.ldf",                  "$T/utils/pyhyphen/pinyin.ldf");       # $T
&I("utils/pyhyphen/pinyin.tr",                   "$S/utils/pyhyphen/pinyin.tr");
&I("utils/pyhyphen/pytest.tex",                  "$D/utils/pyhyphen/pytest.tex");       # $D
&I("utils/pyhyphen/pytestutf8.tex",              "$D/utils/pyhyphen/pytestutf8.tex");   # $D

&I("utils/SJISconv/sjisconv.w",  "$S/utils/SJISconv/sjisconv.w");
&I("utils/SJISconv/sjisltx.bat", "$S/utils/SJISconv/sjisltx.bat");
&I("utils/SJISconv/sjisltx.cmd", "$S/utils/SJISconv/sjisltx.cmd");

&I("utils/subfonts/clonevf.pl",    "$S/utils/subfonts/clonevf.pl");
&I("utils/subfonts/hlatex2agl.pl", "$S/utils/subfonts/hlatex2agl.pl");
&I("utils/subfonts/makefdx.pl",    "$S/utils/subfonts/makefdx.pl");
&I("utils/subfonts/sfd2uni.pl",    "$S/utils/subfonts/sfd2uni.pl");
&I("utils/subfonts/subfonts.pe",   "$S/utils/subfonts/subfonts.pe");
&I("utils/subfonts/uni2sfd.pl",    "$S/utils/subfonts/uni2sfd.pl");
&I("utils/subfonts/vertical.pe",   "$S/utils/subfonts/vertical.pe");
&I("utils/subfonts/vertref.pe",    "$S/utils/subfonts/vertref.pe");

# utils/thaifont/tools/dbtt-old/config.dbtt-old    ---
# utils/thaifont/tools/dbtt-old/dbtt-old-alias.etx ---
# utils/thaifont/tools/dbtt-old/dbtt-old-alias.mtx ---
# utils/thaifont/tools/dbtt-old/dbtt-old-alias.tex ---
# utils/thaifont/tools/dbtt-old/dbtt-old.fontinst  ---
# utils/thaifont/tools/dbtt-old/dbtt-old.map       ---
# utils/thaifont/tools/INSTALL                     ---


#
# cjk-4.8.5-doc
# -------------
#

&I("doc/cjk/README",       "$D/doc/cjk/README");
&I("doc/cjk/READMEb5.cjk", "$D/doc/cjk/READMEb5.cjk");

# doc/dvi/READMEb5.dvi ---
# doc/dvi/READMEgb.dvi ---

&I("doc/pdf/READMEb5.pdf", "$D/doc/pdf/READMEb5.pdf");
&I("doc/pdf/READMEgb.pdf", "$D/doc/pdf/READMEgb.pdf");

&I("examples/cjk/Big5.cjk",     "$D/examples/cjk/Big5.cjk");
&I("examples/cjk/Big5vert.cjk", "$D/examples/cjk/Big5vert.cjk");
&I("examples/cjk/CEF_test.cjk", "$D/examples/cjk/CEF_test.cjk");
&I("examples/cjk/CJKbabel.cjk", "$D/examples/cjk/CJKbabel.cjk");
&I("examples/cjk/muletest.cjk", "$D/examples/cjk/muletest.cjk");
&I("examples/cjk/rubytest.cjk", "$D/examples/cjk/rubytest.cjk");
&I("examples/cjk/SJIS.cjk",     "$D/examples/cjk/SJIS.cjk");
&I("examples/cjk/thai.cjk",     "$D/examples/cjk/thai.cjk");

# examples/dvi/Big5.dvi     ---
# examples/dvi/Big5vert.dvi ---
# examples/dvi/CEF_test.dvi ---
# examples/dvi/CJKbabel.dvi ---
# examples/dvi/CJKfntef.dvi ---
# examples/dvi/CJKmixed.dvi ---
# examples/dvi/CJKspace.dvi ---
# examples/dvi/CJKutf8.dvi  ---
# examples/dvi/GB.dvi       ---
# examples/dvi/JIS.dvi      ---
# examples/dvi/KS.dvi       ---
# examples/dvi/muletest.dvi ---
# examples/dvi/py_test.dvi  ---
# examples/dvi/pytest.dvi   ---
# examples/dvi/rubytest.dvi ---
# examples/dvi/SJIS.dvi     ---
# examples/dvi/thai.dvi     ---
# examples/dvi/UTF8.dvi     ---

&I("examples/pdf/Big5.pdf",     "$D/examples/pdf/Big5.pdf");
&I("examples/pdf/Big5vert.pdf", "$D/examples/pdf/Big5vert.pdf");
&I("examples/pdf/CEF_test.pdf", "$D/examples/pdf/CEF_test.pdf");
&I("examples/pdf/CJKbabel.pdf", "$D/examples/pdf/CJKbabel.pdf");
&I("examples/pdf/CJKfntef.pdf", "$D/examples/pdf/CJKfntef.pdf");
&I("examples/pdf/CJKmixed.pdf", "$D/examples/pdf/CJKmixed.pdf");
&I("examples/pdf/CJKspace.pdf", "$D/examples/pdf/CJKspace.pdf");
&I("examples/pdf/CJKutf8.pdf",  "$D/examples/pdf/CJKutf8.pdf");
&I("examples/pdf/GB.pdf",       "$D/examples/pdf/GB.pdf");
&I("examples/pdf/JIS.pdf",      "$D/examples/pdf/JIS.pdf");
&I("examples/pdf/KS.pdf",       "$D/examples/pdf/KS.pdf");
&I("examples/pdf/muletest.pdf", "$D/examples/pdf/muletest.pdf");
&I("examples/pdf/py_test.pdf",  "$D/examples/pdf/py_test.pdf");
&I("examples/pdf/pytest.pdf",   "$D/examples/pdf/pytest.pdf");
&I("examples/pdf/rubytest.pdf", "$D/examples/pdf/rubytest.pdf");
&I("examples/pdf/SJIS.pdf",     "$D/examples/pdf/SJIS.pdf");
&I("examples/pdf/thai.pdf",     "$D/examples/pdf/thai.pdf");
&I("examples/pdf/thai_utf8.pdf","$D/examples/pdf/thai_utf8.pdf");
&I("examples/pdf/UTF8.pdf",     "$D/examples/pdf/UTF8.pdf");

1;
# EOF
