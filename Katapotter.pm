package Katapotter;

use Modern::Perl;
use List::MoreUtils qw/uniq first_index/;
use Data::Dumper;

sub price {
    my @booklist = @_;
    return 0 if @booklist < 1;
    my $unit_price = 8;
    return $unit_price if @booklist == 1;
    my $remise = {
        0 => 0,
        1 => 1,
        2 => 0.95,
        3 => 0.9,
        4 => 0.8,
        5 => 0.75,
    };
    my @unique_books = uniq @booklist;
    @booklist = array_diff( \@booklist, \@unique_books );
    my $nb_unique_books = @unique_books;
    return $nb_unique_books * $unit_price * $remise->{$nb_unique_books} + price( @booklist );
}

sub array_diff {
    my ( $a, $b ) = @_;
    my @already_replaced;
    return grep {
        my $t = $_;
        my $r2 = grep {$_ == $t} @already_replaced;
        push @already_replaced, $t;
        $r2;
    } @$a;
}

sub array_diff2 {
    my ( $a, $b ) = @_;
    my @already_replaced;
    my @c;
    for my $f( @$a ) {
        if ( grep /$f/, @$b ) {
            my $index = first_index { defined $_ and ($_ eq $f) } @$a;
            delete @$a[$index] if not grep /$f/, @already_replaced;
            push @already_replaced, $f;
        }
    }
    @c = map {( not defined $_ ) ? () : $_} @$a;
    return @c;
}

1;
