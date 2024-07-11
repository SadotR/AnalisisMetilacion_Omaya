#!/usr/bin/perl

=pod
This script processes the $no_hit_file to find scaffold names and methylation coordinates,
then matches these coordinates within the $genome_file. For each scaffold, it extracts a region
from 300 characters before the first coordinate to 300 characters after the last consecutive coordinate.
=cut

use warnings;
use strict;

# Input variables
my $genome_file = $ARGV[0] or die "Usage: $0 genome_file no_hit_file\n";
my $no_hit_file = $ARGV[1] or die "Usage: $0 genome_file no_hit_file\n";
my $scaffold_methylated = "${genome_file}_methylated.txt";

# Open filehandles
open(GENOME, "<", $genome_file) or die "I can't open $genome_file: $!\n";
open(NHI, "<", $no_hit_file) or die "I can't open $no_hit_file: $!\n";
open(SMC, ">", $scaffold_methylated) or die "I can't create $scaffold_methylated: $!\n";

# Read no_hit_file and process each line
my %scaffold_coords;
while(<NHI>) {
    chomp;
    if (/^(.*?)--(\d+)$/) {
        my ($scaffold, $coord) = ($1, $2);
        push @{$scaffold_coords{$scaffold}}, $coord;
    } else {
        warn "Invalid line format: $_\n";
    }
}
close NHI;

# Process each scaffold to find the regions of interest
foreach my $scaffold (keys %scaffold_coords) {
    my @coords = sort { $a <=> $b } @{$scaffold_coords{$scaffold}};

    # Identify consecutive coordinates
    my @regions;
    my $start_coord = $coords[0];
    my $prev_coord = $coords[0];

    for my $i (1 .. $#coords) {
        if ($coords[$i] == $prev_coord + 1) {
            $prev_coord = $coords[$i];
        } else {
            push @regions, [$start_coord, $prev_coord];
            $start_coord = $coords[$i];
            $prev_coord = $coords[$i];
        }
    }
    push @regions, [$start_coord, $prev_coord];

    # Process each region
    seek(GENOME, 0, 0);  # Reset genome filehandle to the beginning
    my $scaffold_found = 0;
    while(<GENOME>) {
        if (/^>$scaffold\s*/) {
            $scaffold_found = 1;
            last;
        }
    }

    if ($scaffold_found) {
        my $sequence = '';
        while (<GENOME>) {
            last if /^>/;
            chomp;
            $sequence .= $_;
        }

        for my $region (@regions) {
            my ($start, $end) = @$region;
            $start = $start - 300;
            $end = $end + 300;
            $start = 0 if $start < 0;
            if ($end < length($sequence)) {
                my $extracted_sequence = substr($sequence, $start, $end - $start + 1);
                print SMC ">$scaffold\_$start\_$end\n$extracted_sequence\n";
            } else {
                warn "Scaffold $scaffold sequence is too short for coordinates $start to $end\n";
            }
        }
    } else {
        warn "Scaffold $scaffold not found in genome file\n";
    }
}

# Close filehandles
close GENOME;
close SMC;
