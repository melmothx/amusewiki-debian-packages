#!/bin/bash
set -u
input=$1
output=$(basename $input .pdf)--pp.pdf
sed  -e '/ Tf \| Td /s/\(Tf\|Td\|Tm\|TJ\)\b */\1\n/g' $input > $output

