#!/usr/bin/perl
use Test::More;

my $nb_test = 3;
plan tests => $nb_test;

sub price {
  my @booklist=@_;
  my $nb_books=scalar(@booklist);
  my $remise = {
  0 => 0,
  1 => 1,
  2 => 0.95
  };
  return $nb_books*8*$remise->{$nb_books}

 
}

is(price(1), 8, "1 book = 8€");
is(price(1,2), 8*2*0.95, "2 books differents");
is(price(1,2,3), 8*3*0.90, "3 books differents");
