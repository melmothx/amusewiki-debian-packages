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

if [ "$1" = "bootstrap" ]; then
    rm -rf amusewiki-texlive/opt
    amusewiki/script/install-texlive.sh
    mkdir -p amusewiki-texlive/opt
    mv amusewiki/local/texlive amusewiki-texlive/opt/amusewiki-texlive
    # cleanup the installation directory
    rm -rf amusewiki/local/install-texlive
fi

# create symbolic links
rm -f      amusewiki-texlive/opt/amusewiki-texlive/current
ln -s 2020 amusewiki-texlive/opt/amusewiki-texlive/current
rm -f              amusewiki-texlive/opt/amusewiki-texlive/current/bin/arch
ln -s x86_64-linux amusewiki-texlive/opt/amusewiki-texlive/current/bin/arch
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
Description: Minimal TeX Live installation for Amusewiki
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
