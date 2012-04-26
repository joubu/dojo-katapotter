#!/usr/bin/perl
use Modern::Perl;
use Test::More;
use Katapotter;

is(Katapotter::price(1), 8, "1 book = 8€");
is(Katapotter::price(1,2), 8*2*0.95, "2 different books");
is(Katapotter::price(1,2,3), 8*3*0.90, "3 different books");
is(Katapotter::price(1,1), 8*2, "2 identical books");
is(Katapotter::price(1,1,2), 8*2*0.95+8, "2 identical books and one book");
is(Katapotter::price(1,2,3,1), 8*3*0.9+8, "2 identical books and two books");
is(Katapotter::price(1,2,3,1,1), 8*3*0.9+8*2, "3 identical books and two books in order");
is(Katapotter::price(1,2,1,3,1), 8*3*0.9+8*2, "3 identical books and two books not in order");
is(Katapotter::price(1,2,1,3,1,1), 8*3*0.9+8*3, "4 identical books and two books");
is(Katapotter::price(1,2,3,4,5,1,5), 8*5*0.75+8*2*0.95, "5 different books and 2 books");

done_testing;
