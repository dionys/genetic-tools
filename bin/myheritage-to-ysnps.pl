#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';
use DDP;

die("Usage:\n    $0 <data-file> <index-file>\n") if @ARGV < 2;

my $fh;
my %data;

open($fh, '<', $ARGV[0]) or die("Can't open data file \"$ARGV[0]\"");
while(<$fh>) {
    next if index($_, '#') == 0;

    my (undef, $chr, $pos, $mut) = map { /"([^"]+)"/ } split(',', $_);  #"

    next unless $chr && $chr eq 'Y';
    next unless $mut =~ /(.)\1/;
    next if $1 eq '-';

    $data{$pos} = [$1];
}
close($fh);

my $i;
open($fh, '<', $ARGV[1]) or die("Can't open index file \"$ARGV[1]\"");
while(<$fh>) {
    s/[\r\n]//g;

    my ($snp, undef, undef, undef, $pos, $mut) = split(/\t/, $_);

    next unless exists($data{$pos});

    $data{$pos}[1] = [] unless $data{$pos}[1];

    push(@{$data{$pos}[1]}, $snp . ($data{$pos}[0] eq substr($mut, -1, 1) ? '+' : '-'));
}
close($fh);

print(join(', ', sort map { @{$_->[1]} } grep { $_->[1] } values(%data)), "\n");
