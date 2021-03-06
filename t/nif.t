#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 10;

use Business::ES::NIF;

my $NIF = Business::ES::NIF->new( nif => '01234567L' );

is $NIF->{status},1,'NIF Correcto';

$NIF->set('12345678L');
is $NIF->{status},0,'NIF Invalid';
is $NIF->{type},'NIF','Tipo NIF';

$NIF->set('12345678LL');
is $NIF->{status},0,'NIF Invalid';

$NIF->set('12345678');
is $NIF->{status},0,'NIF Invalid';

$NIF->set('B18181817');
is $NIF->{nif},'B18181817','CIF SET';
is $NIF->{type},'CIF','Tipo CIF';
is $NIF->{status},0,'CIF Invalid';

$NIF->set('E8181817');
is $NIF->{status},0,'CIF Invalid';

$NIF->set('B18181818');
is $NIF->{status},1,'CIF Correcto';

done_testing();
