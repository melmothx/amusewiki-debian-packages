#!/bin/bash

set -e
cwd=$(pwd)
cd $(dirname $0)
cd xindy
cp italian/utf8.pl.in italian/utf8.pl
perl -I. italian/utf8.pl italian/utf8
cp italian/utf8.xdy $cwd/italian-utf8.xdy

