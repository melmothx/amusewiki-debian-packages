#!/bin/sh

# gentipa.sh --- a shell script for producing TIPA parameter files.
# 
# 1996/06/24 first version
# 2001/11/07 bs10 (= BXSL10), sb10 (=SSBX10), si10 (=SSSL10) added.
# 2001/12/21 tt8, tt9, tt10, tt12, ts10 (=SLTT10) added.

AWK=gawk

DATE="2003/01/01"
VERSION="1.2"

PARAMFILE="tipaprm.def"

FILES="tipa8 tipa9 tipa10 tipa12 tipa17 tipasl8 tipasl9 tipasl10 tipasl12 \
	tipabx8 tipabx9 tipabx10 tipabx12 tipass8 tipass9 tipass10 tipass12 \
	tipass17 tipab10 tipabs10 tipasb10 tipasi10 \
	tipatt8 tipatt9 tipatt10 tipatt12 tipats10"

for FNAME in $FILES
do
  case "$FNAME" in
    tipa8)    NUM=3; FID="TIPA";  FSIZE="8"; FDESC="Roman 8" ;;
    tipa9)    NUM=4; FID="TIPA";  FSIZE="9"; FDESC="Roman 9" ;;
    tipa10)   NUM=5; FID="TIPA";  FSIZE="10";FDESC="Roman 10" ;;
    tipa12)   NUM=6; FID="TIPA";  FSIZE="12";FDESC="Roman 12" ;;
    tipa17)   NUM=7; FID="TIPA";  FSIZE="17.28";FDESC="Roman 17.28" ;;
    tipasl8)  NUM=8; FID="TIPASL";FSIZE="8"; FDESC="Slanted Roman 8" ;;
    tipasl9)  NUM=9; FID="TIPASL";FSIZE="9"; FDESC="Slanted Roman 9" ;;
    tipasl10) NUM=10;FID="TIPASL";FSIZE="10";FDESC="Slanted Roman 10" ;;
    tipasl12) NUM=11;FID="TIPASL";FSIZE="12";FDESC="Slanted Roman 12" ;;
    tipabx8)  NUM=12;FID="TIPABX";FSIZE="8"; FDESC="Bold Extended Roman 8" ;;
    tipabx9)  NUM=13;FID="TIPABX";FSIZE="9"; FDESC="Bold Extended Roman 9" ;;
    tipabx10) NUM=14;FID="TIPABX";FSIZE="10";FDESC="Bold Extended Roman 10" ;;
    tipabx12) NUM=15;FID="TIPABX";FSIZE="12";FDESC="Bold Extended Roman 12" ;;
    tipass8)  NUM=16;FID="TIPASS";FSIZE="8"; FDESC="Sans Serif 8" ;;
    tipass9)  NUM=17;FID="TIPASS";FSIZE="9"; FDESC="Sans Serif 9" ;;
    tipass10) NUM=18;FID="TIPASS";FSIZE="10";FDESC="Sans Serif 10" ;;
    tipass12) NUM=19;FID="TIPASS";FSIZE="12";FDESC="Sans Serif 12" ;;
    tipass17) NUM=20;FID="TIPASS";FSIZE="17.28";FDESC="Sans Serif 17.28" ;;
    tipab10)  NUM=21;FID="TIPAB"; FSIZE="10";FDESC="Bold Roman 10" ;;
    tipabs10) NUM=22;FID="TIPABS";FSIZE="10";FDESC="Bold Extended Slanted Roman 10" ;;
    tipasb10) NUM=23;FID="TIPASB";FSIZE="10";FDESC="Sans Serif Bold Extended 10" ;;
    tipasi10) NUM=24;FID="TIPASI";FSIZE="10";FDESC="Sans Serif Slanted 10" ;;
    tipatt8)  NUM=25;FID="TIPATT";FSIZE="8"; FDESC="Typewriter Text 8" ;;
    tipatt9)  NUM=26;FID="TIPATT";FSIZE="9"; FDESC="Typewriter Text 9" ;;
    tipatt10) NUM=27;FID="TIPATT";FSIZE="10";FDESC="Typewriter Text 10" ;;
    tipatt12) NUM=28;FID="TIPATT";FSIZE="12";FDESC="Typewriter Text 12" ;;
    tipats10) NUM=29;FID="TIPATS";FSIZE="10";FDESC="Typewriter Text Slanted 10" ;;
  esac

  echo "% $FNAME.mf: TIPA $FDESC point parameter file" > $FNAME.mf
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
  echo 'generate tipa    % switch to the driver file' >> $FNAME.mf
done

exit 0
