# $Id: run.sh 831 2020-06-04 18:07:54Z karl $
# Public domain.

if [ ! -e ./pdftex ]; then
  ln -s ../../source/build-pdftex/texk/web2c/pdftex .
fi

set -x
TFMFONTS=. ./pdftex -ini ./f.tex
