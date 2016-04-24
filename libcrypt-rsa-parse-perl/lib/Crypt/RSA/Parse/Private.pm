package Crypt::RSA::Parse::Private;

use parent qw(Crypt::RSA::Parse::KeyBase);

use parent qw(Class::Accessor::Fast);

__PACKAGE__->mk_ro_accessors(
    qw(
      version
      publicExponent
      privateExponent
      prime1
      prime2
      exponent1
      exponent2
      coefficient
      )
);

1;
