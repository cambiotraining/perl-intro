# Cambridge Perl course
# Lesson 16 Exercise

use strict;
use warnings;

use Data::Dumper;


# Exercise I
# Modify the subroutine from Lesson 10 exercise 2, which calculates
# the mean of a list of numbers. Make it take an array reference
# as input, instead of the array itself.
sub mean {
    my $nums = shift;
    my $sum = 0;
    foreach my $num (@{$nums}) {
        $sum += $num;
    }
    return $sum/@{$nums};
}

my @genome_mb = (100.3, 2700, 4.6, 3200, 12.1);
print mean(\@genome_mb), "\n";



# Question 2
# Write a subroutine that takes two array references as input, which
# are the same length (you could check that they are the same length!).
# Have it return a reference to a hash, where the keys are the
# elements of the first array, and the values of the hash are the
# elements of the second array.
sub zip {
    my $arr1 = shift;
    my $arr2 = shift;
    die "Length mismatch!" unless (@{$arr1} == @{$arr2});
    my %zipped;

    for my $i (0..(@{$arr1} - 1)) {
        $zipped{$arr1->[$i]} = $arr2->[$i];
    }
  
    return \%zipped;
}

my @array1 = (1,2,3);
my @array2 = qw/a b c/;  # A short way of making an array of strings!
my $zip_ref = zip(\@array1, \@array2);
print Dumper $zip_ref;

