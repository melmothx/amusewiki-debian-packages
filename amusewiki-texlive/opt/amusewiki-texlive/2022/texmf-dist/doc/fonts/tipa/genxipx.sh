#!/bin/sh

# genxipx.sh --- a shell script for producing XIPX parameter files.
# 
# 1996/06/24 first version
#

AWK=gawk

DATE="2003/01/01"
VERSION="1.2"

PARAMFILE="xipaprm.def"

FILES="xipx10 xipxsl10 xipxb10 xipxbs10 xipxss10 xipxsi10 xipxsb10"

for FNAME in $FILES
do
  case "$FNAME" in
    xipx10)   NUM=3;FID="XIPX";  FSIZE="10";FDESC="Roman 10" ;;
    xipxsl10) NUM=4;FID="XIPXSL";FSIZE="10";FDESC="Slanted Roman 10" ;;
    xipxb10)  NUM=5;FID="XIPXB"; FSIZE="10";FDESC="Bold Roman 10" ;;
    xipxbs10) NUM=6;FID="XIPXBS";FSIZE="10";FDESC="Bold Slanted Roman 10" ;;
    xipxss10) NUM=7;FID="XIPXSS";FSIZE="10";FDESC="Sans Serif 10" ;;
    xipxsi10) NUM=8;FID="XIPXSI";FSIZE="10";FDESC="Sans Serif Slanted 10" ;;
    xipxsb10) NUM=9;FID="XIPXSB";FSIZE="10";FDESC="Sans Serif Bold 10" ;;
  esac

  echo "% $FNAME.mf: XIPX $FDESC point parameter file" > $FNAME.mf
  echo "% Copyright 1996-2003 FUKUI Rei" >> $FNAME.mf
  echo "%" >> $FNAME.mf
  echo "% This program may be distributed and/or modified under the" >> $FNAME.mf
  echo "% conditions of the LaTeX Project Public License, either version 1.2" >> $FNAME.mf
  echo "% of this license or (at your option) any later version." >> $FNAME.mf
  echo "% The latest version of this license is in" >> $FNAME.mf
  echo "%   http://www.latex-project.org/lppl.txt" >> $FNAME.mf
  echo "% and version 1.2 or later is part of all distributions of LaTeX " >> $FNAME.mf
  echo "% version 1999/12/01 or later." >> $FNAME.mf
  echo "%" >> $FNAME.mf
  echo "% This program consists of all files listed in Manifest.txt." >> $FNAME.mf
  echo "%" >> $FNAME.mf
  echo "%   Version $VERSION $DATE" >> $FNAME.mf
  echo "%" >> $FNAME.mf
  echo '% This file is based on:' >> $FNAME.mf
  echo '%   Computer Modern font series by D. E. Knuth and' >> $FNAME.mf
  echo '%   TSIPA by KOBAYASHI Hajime, FUKUI Rei and SHIRAKAWA Shun.' >> $FNAME.mf
  echo '' >> $FNAME.mf
  echo 'if unknown cmbase: input cmbase fi' >> $FNAME.mf
  echo 'if unknown tipabase: input tipabase fi' >> $FNAME.mf
  echo '' >> $FNAME.mf
  echo "font_identifier:=\"$FID\"; font_size ${FSIZE}pt#;" >> $FNAME.mf
  echo '' >> $FNAME.mf
  echo 'Times_Compat:=true;' >> $FNAME.mf
  echo 'if Times_Compat: input tipatr fi' >> $FNAME.mf
  echo '' >> $FNAME.mf
  $AWK "{if (\$1 == \"p\") {
     if (\$$NUM == \"0\") print \$2 \"#:=\" \$$NUM \"pt#;\";\
     else print \$2 \"#:=\" \$$NUM \"/36pt#;\";\
   }\
   else if (\$1 == \"P\") print \$2 \"#:=\" \$$NUM \"pt#;\";\
   else if (\$1 == \"n\") print \$2 \":=\"  \$$NUM \";\";}" $PARAMFILE |\
  sed 's/SQ/sqrt/' >> $FNAME.mf
  echo '' >> $FNAME.mf
  echo 'generate tipx    % switch to the driver file' >> $FNAME.mf
done

exit 0
