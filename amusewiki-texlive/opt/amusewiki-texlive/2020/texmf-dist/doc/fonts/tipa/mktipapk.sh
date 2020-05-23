#!/bin/sh
#
# This script generates pk font files for tipa.
#
# TIPA is a set of metafont source files for IPA (International
# Phonetic Alphabet) symbols. You can get it from the CTAN archive.
#
# In order to use this script, metafont programs, gftopk, and metafont
# source files (*.mf) must be installed properly.
#
# You should also be familiar with the `modes.mf' file which contains
# parameters for various printers.
#
# 1996/03/12  FUKUI Rei (fkr@tooyoo.L.u-tokyo.ac.jp)
#

progname=`basename "$0"`
MF=mf

if [ $# != 0 ]; then
	MODE=$1
else
	echo "Usage: $progname mode_name"
	echo "Examples: $progname localfont"
	echo "        : $progname CanonCX"
	exit 1
fi

execmf()
{
	for file in $MFFILES
	do
	    echo "[ $file at mag=$MAG ]"
	    $MF "\mode=$MODE; mag=$MAG; nonstopmode;" input $file
	done
}

cmbase=/usr/local/lib/texmf/fonts/public/cm/src/cmbase.mf
if [ -f $cmbase ]; then
    ln -s $cmbase cmbase.mf
fi

##############################
# make all fonts for mag 5/8 #
##############################

MFFILES="tipa8 tipasl8 tipabx8 tipass8"
MAG=5/8
execmf

##############################
# make all fonts for mag 6/8 #
##############################

MFFILES="tipa8 tipasl8 tipabx8 tipass8"
MAG=6/8
execmf

##############################
# make all fonts for mag 7/8 #
##############################

MFFILES="tipa8 tipasl8 tipabx8 tipass8"
MAG=7/8
execmf

#############################
# make all fonts for mag .5 #
#############################

MFFILES="tipab10"
MAG=.5
execmf

#############################
# make all fonts for mag .6 #
#############################

MFFILES="tipab10"
MAG=.6
execmf

#############################
# make all fonts for mag .7 #
#############################

MFFILES="tipab10"
MAG=.7
execmf

#############################
# make all fonts for mag .8 #
#############################

MFFILES="tipab10"
MAG=.8
execmf

#############################
# make all fonts for mag .9 #
#############################

MFFILES="tipab10"
MAG=.9
execmf

############################
# make all fonts for mag 1 #
############################

MFFILES="tipa8 tipa9 tipa10 tipa12 tipa17 tipasl8 tipasl9 tipasl10 tipasl12 \
	tipabx8 tipabx9 tipabx10 tipabx12 tipass8 tipass9 tipass10 tipass12 \
	tipass17 tipab10"
MAG=1
execmf

##################################
# make all fonts for magstep 0.5 #
##################################

MFFILES="tipa10 tipasl10 tipabx10 tipass10 tipab10"
MAG=magstep.5
execmf

################################
# make all fonts for magstep 1 #
################################

MFFILES="tipa12 tipa17 tipasl12 tipabx12 tipass12 tipass17 tipab10"
MAG=magstep1
execmf

################################
# make all fonts for magstep 2 #
################################

MFFILES="tipa17 tipasl12 tipabx12 tipass17 tipab10"
MAG=magstep2
execmf

################################
# make all fonts for magstep 3 #
################################

MFFILES="tipasl12 tipabx12 tipab10"
MAG=magstep3
execmf

################################
# make all fonts for magstep 4 #
################################

MFFILES="tipasl12 tipabx12 tipab10"
MAG=magstep4
execmf

################################
# make all fonts for magstep 5 #
################################

MFFILES="tipab10"
MAG=magstep5
execmf

for gf in tipa*gf
do
	gftopk $gf
done

rm -f *gf *.log cmbase.mf
#rm -f *.tfm

exit 0
