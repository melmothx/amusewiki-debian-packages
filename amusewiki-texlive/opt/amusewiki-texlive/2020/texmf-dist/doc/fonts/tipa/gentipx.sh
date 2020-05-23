#!/bin/sh

# gentipx.sh --- a shell script for producing TIPX parameter files.
# 
# 2001/11/21 first version
# 2001/12/21 tt8, tt9, tt10, tt12, ts10 (=SLTT10) added.

AWK=gawk

DATE="2003/01/01"
VERSION="1.2"

PARAMFILE="tipaprm.def"

FILES="tipx8 tipx9 tipx10 tipx12 tipx17 tipxsl8 tipxsl9 tipxsl10 tipxsl12 \
	tipxbx8 tipxbx9 tipxbx10 tipxbx12 tipxss8 tipxss9 tipxss10 tipxss12 \
	tipxss17 tipxb10 tipxbs10 tipxsb10 tipxsi10 \
	tipxtt8 tipxtt9 tipxtt10 tipxtt12 tipxts10"

for FNAME in $FILES
do
  case "$FNAME" in
    tipx8)    NUM=3; FID="TIPX";  FSIZE="8"; FDESC="Roman 8" ;;
    tipx9)    NUM=4; FID="TIPX";  FSIZE="9"; FDESC="Roman 9" ;;
    tipx10)   NUM=5; FID="TIPX";  FSIZE="10";FDESC="Roman 10" ;;
    tipx12)   NUM=6; FID="TIPX";  FSIZE="12";FDESC="Roman 12" ;;
    tipx17)   NUM=7; FID="TIPX";  FSIZE="17.28";FDESC="Roman 17.28" ;;
    tipxsl8)  NUM=8; FID="TIPXSL";FSIZE="8"; FDESC="Slanted Roman 8" ;;
    tipxsl9)  NUM=9; FID="TIPXSL";FSIZE="9"; FDESC="Slanted Roman 9" ;;
    tipxsl10) NUM=10;FID="TIPXSL";FSIZE="10";FDESC="Slanted Roman 10" ;;
    tipxsl12) NUM=11;FID="TIPXSL";FSIZE="12";FDESC="Slanted Roman 12" ;;
    tipxbx8)  NUM=12;FID="TIPXBX";FSIZE="8"; FDESC="Bold Extended Roman 8" ;;
    tipxbx9)  NUM=13;FID="TIPXBX";FSIZE="9"; FDESC="Bold Extended Roman 9" ;;
    tipxbx10) NUM=14;FID="TIPXBX";FSIZE="10";FDESC="Bold Extended Roman 10" ;;
    tipxbx12) NUM=15;FID="TIPXBX";FSIZE="12";FDESC="Bold Extended Roman 12" ;;
    tipxss8)  NUM=16;FID="TIPXSS";FSIZE="8"; FDESC="Sans Serif 8" ;;
    tipxss9)  NUM=17;FID="TIPXSS";FSIZE="9"; FDESC="Sans Serif 9" ;;
    tipxss10) NUM=18;FID="TIPXSS";FSIZE="10";FDESC="Sans Serif 10" ;;
    tipxss12) NUM=19;FID="TIPXSS";FSIZE="12";FDESC="Sans Serif 12" ;;
    tipxss17) NUM=20;FID="TIPXSS";FSIZE="17.28";FDESC="Sans Serif 17.28" ;;
    tipxb10)  NUM=21;FID="TIPXB"; FSIZE="10";FDESC="Bold Roman 10" ;;
    tipxbs10) NUM=22;FID="TIPXBS";FSIZE="10";FDESC="Bold Extended Slanted Roman 10" ;;
    tipxsb10) NUM=23;FID="TIPXSB";FSIZE="10";FDESC="Sans Serif Bold Extended 10" ;;
    tipxsi10) NUM=24;FID="TIPXSI";FSIZE="10";FDESC="Sans Serif Slanted 10" ;;
    tipxtt8)  NUM=25;FID="TIPXTT";FSIZE="8"; FDESC="Typewriter Text 8" ;;
    tipxtt9)  NUM=26;FID="TIPXTT";FSIZE="9"; FDESC="Typewriter Text 9" ;;
    tipxtt10) NUM=27;FID="TIPXTT";FSIZE="10";FDESC="Typewriter Text 10" ;;
    tipxtt12) NUM=28;FID="TIPXTT";FSIZE="12";FDESC="Typewriter Text 12" ;;
    tipxts10) NUM=29;FID="TIPXTS";FSIZE="10";FDESC="Typewriter Text Slanted 10" ;;
  esac

  echo "% $FNAME.mf: TIPX $FDESC point parameter file" > $FNAME.mf
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
  echo "%   Version $VERSION $DATE FUKUI Rei" >> $FNAME.mf
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
  echo 'Times_Compat:=false;' >> $FNAME.mf
  echo 'if Times_Compat: input tipatr fi' >> $FNAME.mf
  echo '' >> $FNAME.mf
  $AWK "{if (\$1 == \"p\") {
     if (\$$NUM == \"0\") print \$2 \"#:=\" \$$NUM \"pt#;\";\
     else print \$2 \"#:=\" \$$NUM \"/36pt#;\";\
   }\
   else if (\$1 == \"P\") print \$2 \"#:=\" \$$NUM \"pt#;\";\
   else if (\$1 == \"n\") print \$2 \":=\"  \$$NUM \";\";}" $PARAMFILE |\
  sed 's/SQ/sqrt/' | sed 's/SC12/sind 12\/cosd 12/' >> $FNAME.mf
  echo '' >> $FNAME.mf
  echo 'generate tipx    % switch to the driver file' >> $FNAME.mf
done

exit 0
