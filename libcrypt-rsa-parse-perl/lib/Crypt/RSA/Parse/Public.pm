package Crypt::RSA::Parse::Public;

use parent qw(Crypt::RSA::Parse::KeyBase);

use parent qw(Class::Accessor::Fast);

__PACKAGE__->mk_ro_accessors('exponent');

1;
