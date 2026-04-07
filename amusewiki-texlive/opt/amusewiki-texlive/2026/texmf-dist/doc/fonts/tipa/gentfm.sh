#!/bin/sh

modename="ljfour"

tipafonts="tipa10.mf tipa12.mf tipa17.mf tipa8.mf tipa9.mf\
  tipabx10.mf tipabx12.mf tipabx8.mf tipabx9.mf\
  tipasl10.mf tipasl12.mf tipasl8.mf tipasl9.mf\
  tipass10.mf tipass12.mf tipass17.mf tipass8.mf tipass9.mf\
  tipab10.mf tipabs10.mf tipasb10.mf tipasi10.mf\
  tipatt10.mf tipatt12.mf tipatt8.mf tipatt9.mf tipats10.mf"

tipxfonts="tipx10.mf tipx12.mf tipx17.mf tipx8.mf tipx9.mf\
  tipxbx10.mf tipxbx12.mf tipxbx8.mf tipxbx9.mf\
  tipxsl10.mf tipxsl12.mf tipxsl8.mf tipxsl9.mf\
  tipxss10.mf tipxss12.mf tipxss17.mf tipxss8.mf tipxss9.mf\
  tipxb10.mf tipxbs10.mf tipxsb10.mf tipxsi10.mf\
  tipxtt10.mf tipxtt12.mf tipxtt8.mf tipxtt9.mf tipxts10.mf"

xipafonts="xipa10.mf xipab10.mf xipasl10.mf xipass10.mf\
  xipabs10 xipasi10 xipasb10"

xipxfonts="xipx10.mf xipxb10.mf xipxsl10.mf xipxss10.mf\
  xipxbs10 xipxsi10 xipxsb10"

allfonts="$tipafonts $tipxfonts $xipafonts $xipxfonts"

for i in $allfonts
do
  mf '\mode='$modename'; input' $i
done

install -c -m 644 *.tfm ../tfm

exit 0
