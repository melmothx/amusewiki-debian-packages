#!/usr/bin/perl -s

use 5.026;
use warnings;
our ($style);
$style ||= '';

my ($line, $seq, $cmp, $cid, %svs_list, @svs, $i);

while ($line=<>) {

    next if ($line=~/^%/);
    chomp $line;

    ($seq, $cmp, $cid) = split "\t", $line;

    @_ = split ' ', $seq;
    my ($base,$svs) = (@_);

    push @svs, $seq;
    if ($style ne 'min') {
        $svs_list{"$seq"} = "$base-$svs($cmp) ";
    }
    $svs_list{"$seq"} .= chr(hex($base))."/".chr(hex($base)).chr(hex($svs)).chr(hex($cmp));

}

#@svs = sort(@svs);

$i=0;
foreach $seq (@svs) {

    print $svs_list{"$seq"};
    if ($style ne 'min') {
        if ($i % 3 == 2){ say '\par'; }
        else            { say ' '; }
    } else {
        print ' ';
        if ($i % 10 == 9){ say '%'; }
    }
    $i++;

}

if ($style eq 'min') {
    say '';
}
