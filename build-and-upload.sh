#!/bin/bash

set -e
dir=$1

if [ ! -d "$dir" ]; then
    echo "$dir is not a directory"
    exit 2;
fi

rm -fv ${dir}*.{deb,build,changes}

cd $dir
if [ $dir = 'amusewiki' ]; then
    rm -rf shared/archive/
fi
debuild -i -us -uc --pre-clean --post-clean -b
fakeroot debian/rules clean
cd ..
for i in ${dir}*.deb; do
    dpkg --contents $i
done
