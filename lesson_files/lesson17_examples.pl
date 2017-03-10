# Cambridge Perl course
# Lesson 16 Examples

use strict;
use warnings;

use Data::Dumper;


# Reference to a scalar
my $number = 10;
my $number_ref = \$number;
print "number_ref: $number_ref\n";
print "number_ref dereferenced: $$number_ref\n";
$number = 20;
print "number: $number. number_ref dereferenced: $$number_ref\n";
$$number_ref = 30;
print "number: $number. number_ref dereferenced: $$number_ref\n";

# Reference to an array
my @serine_array = ('TCA', 'TCC', 'TCG', 'TCT');
my $serine_ref = \@serine_array;

print "serine_array: @serine_array\n";
print "serine_ref: $serine_ref\n";
print "serine_ref dereferenced: @{$serine_ref}\n";

$serine_array[0] = 'ABC';
$serine_ref->[1] = 'DEF';

print "serine_array: @serine_array\n";
print "serine_ref dereferenced: @{$serine_ref}\n";


# Hash reference passed to a subroutine
my %expression = (gene1 => 1, gene2 => 2);
print "Before double_the_values\n";
print Dumper \%expression;
double_the_values(\%expression);
print "\nAfter double_the_values\n";
print Dumper \%expression;

sub double_the_values {
    my $hash_ref = shift;
    for my $key (keys %{$hash_ref}) {
        $hash_ref->{$key} *= 2;
    }
}


# Hash of arrays
my @serine = ('TCA','TCC','TCG','TCT');
my @proline =('CCA','CCC','CCG','CCT');

my %aas;
$aas{'serine'} = \@serine;
$aas{'proline'} = \@proline;

print Dumper \%aas;


# Hash of arrays, shorter
%aas = (
    'serine' => ['TCA', 'TCC', 'TCG', 'TCT'],
    'proline' => ['CCA', 'CCC', 'CCG', 'CCT']
);

print Dumper \%aas;

