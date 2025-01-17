package PDF::API2::Resource::Pattern;

use base 'PDF::API2::Resource';

use strict;
use warnings;

our $VERSION = '2.030'; # VERSION

sub new {
    my ($class, $pdf, $name) = @_;
    my $self = $class->SUPER::new($pdf, $name);

    $self->type('Pattern');

    return $self;
}

# Deprecated (rolled into new)
sub new_api { my $self = shift(); return $self->new(@_); }

1;
