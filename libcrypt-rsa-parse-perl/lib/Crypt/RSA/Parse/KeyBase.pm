package Crypt::RSA::Parse::KeyBase;

use parent qw(Class::Accessor::Fast);

__PACKAGE__->mk_ro_accessors('modulus');

sub size {
    my ($self) = @_;

    return length( $self->modulus()->as_bin() ) - 2;
}

1;
