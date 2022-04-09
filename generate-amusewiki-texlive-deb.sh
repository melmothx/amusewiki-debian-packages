#!/bin/sh

set -x
set -e

# this is meant to be run on new TeXlive release. We are storing the
# whole tree in the git.

# Individual package or the whole installation can be updated calling
# tlmgr from inside it, because being a portable installation, it can
# and should work.

basedir=`pwd`
build=${BUILD:-1}
year=2022

if [ "$1" = "bootstrap" ]; then
    rm -rf amusewiki-texlive/opt
    amusewiki/script/install-texlive.sh
    mkdir -p amusewiki-texlive/opt
    mv amusewiki/local/texlive amusewiki-texlive/opt/amusewiki-texlive
    # cleanup the installation directory
    rm -rf amusewiki/local/install-texlive
fi

# patch serbian data

cat amusewiki-texlive/opt/amusewiki-texlive/$year/texmf-dist/tex/generic/babel/locale/sr/babel-sr-Latn.ini > amusewiki-texlive/opt/amusewiki-texlive/$year/texmf-dist/tex/generic/babel/locale/sr/babel-sr.ini

cat patches/italian-utf8.xdy > amusewiki-texlive/opt/amusewiki-texlive/$year/texmf-dist/xindy/modules/lang/italian/utf8.xdy

# create symbolic links
rm -f      amusewiki-texlive/opt/amusewiki-texlive/current
ln -s $year amusewiki-texlive/opt/amusewiki-texlive/current
rm -f              amusewiki-texlive/opt/amusewiki-texlive/current/bin/arch
ln -s x86_64-linux amusewiki-texlive/opt/amusewiki-texlive/current/bin/arch
echo "Replacing stock texmf.cnf"
cat amusewiki-texlive/opt/amusewiki-texlive/current/texmf.cnf
cat <<EOF> amusewiki-texlive/opt/amusewiki-texlive/current/texmf.cnf
TEXMFHOME = ~/texmf
TEXMFCONFIG = ~/.amusewiki-texlive-$year/texmf-config
TEXMFVAR = ~/.amusewiki-texlive-$year/year/texmf-var
ASYMPTOTE_HOME = \$TEXMFCONFIG/asymptote
EOF
cd $basedir/amusewiki-texlive
mkdir -p DEBIAN
find opt  -type f  -printf '%p ' | xargs md5sum > DEBIAN/md5sums
size=$(du -sk opt | sed -e 's/\t.*$//')
version=`date +%Y%m%d`
cat <<EOF> DEBIAN/control
Package: amusewiki-texlive
Source: amusewiki-texlive
Version: $version-$build
Architecture: amd64
Maintainer: Marco Pessotto <marco@pessotto.hr>
Installed-Size: $size
Section: tex
Priority: optional
Homepage: https://amusewiki.org
Description: Minimal TeX Live $year installation for Amusewiki
 This package contains a minimal and portable installation of TeX Live.
 .
 It is meant to be used by the Amusewiki compiler, but can be used
 outside of it just adding /opt/amusewiki-texlive/current/bin/arch to
 the PATH
EOF

cd $basedir
dpkg-deb --root-owner-group --build \
         $basedir/amusewiki-texlive \
         amusewiki-texlive_$version-${build}_amd64.deb
