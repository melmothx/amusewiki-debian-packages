package Crypt::RSA::Parse;

use strict;
use warnings;

our $VERSION = 0.041;

=pod

=encoding utf-8

=head1 NAME

Crypt::RSA::Parse - Parse RSA keys

=head1 SYNOPSIS

    #General-purpose, native RSA or PKCS8 (DER or PEM)
    my $public_rsa = Crypt::RSA::Parse::public($key_str);
    my $private_rsa = Crypt::RSA::Parse::private($private_key_str);

    $public_rsa->exponent();
    $public_rsa->modulus();     #isa Math::BigInt
    $public_rsa->size();        #i.e., the modulus length in bits

    $private_rsa->version();        #usually 0
    $private_rsa->modulus();        #isa Math::BigInt
    $private_rsa->size();           #i.e., the modulus length in bits

    $private_rsa->publicExponent();     #same as “exponent” on public keys
    $private_rsa->privateExponent();    #isa Math::BigInt
    $private_rsa->prime1();             #isa Math::BigInt
    $private_rsa->prime2();             #isa Math::BigInt
    $private_rsa->exponent1();          #isa Math::BigInt
    $private_rsa->exponent2();          #isa Math::BigInt
    $private_rsa->coefficient();        #isa Math::BigInt

    #Only checks PKCS8 (DER or PEM)
    $public_rsa = Crypt::RSA::Parse::public_pkcs8($pkcs8_str);
    $private_rsa = Crypt::RSA::Parse::private_pkcs8($pkcs8_str);

    {
        #If, for whatever reason, you don’t like MIME::Base64,
        #then customize this. The module must have a decode() function.
        #
        local $Crypt::RSA::Parse::BASE64_MODULE = '..';

        Crypt::RSA::Parse::...
    }

=head1 DESCRIPTION

Not much else to say: it parses RSA keys for useful information!

The public keys are represented via the C<Crypt::RSA::Parse::Public>
class, while private keys are represented via C<Crypt::RSA::Parse::Private>.

=cut

use Crypt::Format ();

use Crypt::RSA::Parse::Parser::MathBigInt ();   #lazy-loads Math::BigInt only

our $BASE64_MODULE = 'MIME::Base64';

my %parser;

sub _MathBigInt {
    return $parser{'MathBigInt'} ||= Crypt::RSA::Parse::Parser::MathBigInt->new();
}

sub private {
    return _MathBigInt()->private(@_);
}

sub public {
    return _MathBigInt()->public(@_);
}

sub private_pkcs8 {
    return _MathBigInt()->private_pkcs8(@_);
}

sub public_pkcs8 {
    return _MathBigInt()->public_pkcs8(@_);
}

#----------------------------------------------------------------------

=head1 AUTHOR

    Felipe M. L. Gasper
    CPAN ID: FELIPE

=head1 REPOSITORY

    https://github.com/FGasper/p5-Crypt-RSA-Parse

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut

1;
