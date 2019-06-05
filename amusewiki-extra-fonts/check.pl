#!/usr/bin/env perl

use utf8;
use strict;
use warnings;
use JSON::MaybeXS qw/decode_json/;
use Path::Tiny;
use Data::Dumper::Concise;

my $list = decode_json(path('fontspec.json')->slurp_raw);
print Dumper($list);

my %packages;

foreach my $f (@$list) {
    foreach my $k (qw/bold bolditalic italic regular/) {
        if (my $font = $f->{$k}) {
            my $out = `dpkg -S $font`;
            if ($out and $out =~ m/(.*?): (.*)/) {
                $packages{$1}++;
            }
            else {
                print "$font unknown? $out\n";
            }
        }
    }
}

print "Depends: " . join(",\n ", sort keys %packages) . "\n";

1;
