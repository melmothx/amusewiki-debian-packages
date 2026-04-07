#!/usr/bin/perl

use 5.026;
use warnings;

my ($line, $seq, $cmp, $cid, %svs_list, @svs);

while ($line=<>) {

    next if ($line=~/^%/);
    chomp $line;

    ($seq, $cmp, $cid) = split "\t", $line;

    @_ = split ' ', $seq;
    $seq = ((hex($_[1])-0xFE00) * 0x40000 + 0x400000) + hex($_[0]);
    $seq = sprintf("%X", $seq);

    push @svs, $seq;
    $svs_list{"$seq"} = $cmp;

}

@svs = sort(@svs);

foreach $seq (@svs) {

    print <<~END;
      (CHARACTER H $seq
        (CHARWD R 1.0)
        (MAP
           (SETCHAR H $svs_list{"$seq"})
           )
        )
      END

}
