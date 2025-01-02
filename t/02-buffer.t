use Test2::V0 -target => 'Crypt::OpenPGP::Buffer';

use Math::BigInt;

my @num = map { Math::BigInt->new( $_ ) } qw( 34093840983 99999999999999999999 1 );

for my $n ( @num ) {
    my $buffer = Crypt::OpenPGP::Buffer->new;
    isa_ok $buffer, 'Crypt::OpenPGP::Buffer';
    $buffer->put_mp_int( $n );
    is $buffer->get_mp_int, $n, 'get_mp_int gives us back what we put in';
}
