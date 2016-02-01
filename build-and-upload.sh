#!/bin/bash

set -e
dir=$1

if [ ! -d "$dir" ]; then
    echo "$dir is not a directory"
    exit 2;
fi

rm -fv ${dir}*.{deb,build,changes}
cd $dir
debuild -i -us -uc -b
cd ..
scp ${dir}*.deb melmothx@packages.amusewiki.org:
