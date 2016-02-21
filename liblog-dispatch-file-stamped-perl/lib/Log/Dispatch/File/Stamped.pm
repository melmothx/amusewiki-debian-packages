use strict;
use warnings;
package Log::Dispatch::File::Stamped; # git description: v0.15-14-g292364f
# ABSTRACT: Logging to date/time stamped files
# KEYWORDS: log logging output file timestamp date rolling rotate
# vim: set ts=8 sts=4 sw=4 tw=115 et :

our $VERSION = '0.16';

use File::Basename        qw(fileparse);
use File::Spec::Functions qw(catfile);
use POSIX                 qw(strftime);

use Log::Dispatch::File 2.38;
use parent 'Log::Dispatch::File';

use Params::Validate qw(validate SCALAR);
Params::Validate::validation_options( allow_extra => 1 );

use namespace::clean 0.19;

sub _basic_init
{
    my $self = shift;

    $self->SUPER::_basic_init(@_);

    my %p = validate(
        @_,
        {
            stamp_fmt => {
                type => SCALAR,
                default => '%Y%m%d',
            },
        },
    );

    $self->{stamp_fmt} = $p{stamp_fmt};

    # cache of last timestamp used
    $self->{_stamp} = '';

    # split pathname into path, basename, extension
    @$self{qw(_name _path _ext)} = fileparse($self->{filename}, '\.[^.]+');

    # stored in $self->{filename} (overwrites original); used by _open_file()
    $self->_make_filename;
}

sub _make_filename
{
    my $self = shift;

    my $stamp = strftime($self->{stamp_fmt}, localtime);

    # re-use last filename if the stamp has not changed
    return $self->{filename} if $stamp eq $self->{_stamp};

    # build the stamped file name
    my $filename = join '-', $self->{_name}, $stamp;
    $filename .= $self->{_ext} if $self->{_ext};
    $self->{filename} = catfile($self->{_path}, $filename);
}

sub log_message
{
    my $self = shift;

    # check if the filename is the same as last time...
    my $old_filename = $self->{filename};
    $self->_make_filename;

    # don't re-open if we use close-after-write - the superclass will do it
    if (not $self->{close} and $old_filename ne $self->{filename})
    {
        $self->_open_file;
    }

    $self->SUPER::log_message(@_);
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Log::Dispatch::File::Stamped - Logging to date/time stamped files

=head1 VERSION

version 0.16

=head1 SYNOPSIS

  use Log::Dispatch::File::Stamped;

  my $file = Log::Dispatch::File::Stamped->new(
    name      => 'file1',
    min_level => 'info',
    filename  => 'Somefile.log',
    stamp_fmt => '%Y%m%d',
    mode      => 'append' );

  $file->log( level => 'emerg', message => "I've fallen and I can't get up\n" );

=head1 DESCRIPTION

This module subclasses L<Log::Dispatch::File> for logging to date/time
stamped files, respecting all its configuration options.

=head1 METHODS

=head2 new(%p)

This method takes the same set of parameters as L<Log::Dispatch::File::new()|Log::Dispatch::File/new>,
with the following differences:

=over 4

=item * filename ($)

The filename template. The actual timestamp will be appended to this filename
when creating the actual logfile. If the filename has an extension, the
timestamp is inserted before the extension. See examples below.

=item * stamp_fmt ($)

The format of the timestamp string. This module uses L<POSIX::strftime|POSIX/strftime> to
create the timestamp string from the current local date and time.
Refer to your platform's C<strftime> documentation for the list of allowed
tokens.

Defaults to C<%Y%m%d>.

=back

=head2 log_message( message => $ )

Sends a message to the appropriate output.  Generally this
shouldn't be called directly but should be called through the
C<log()> method (in L<Log::Dispatch::Output>).

=head1 EXAMPLES

=for stopwords txt

Assuming the current date and time is:

  % perl -e 'print scalar localtime'
  Sat Feb  8 13:56:13 2003

  Log::Dispatch::File::Stamped->new(
    name      => 'file',
    min_level => 'debug',
    filename  => 'logfile.txt',
  );

This will log to file F<logfile-20030208.txt>.

  Log::Dispatch::File::Stamped->new(
    name      => 'file',
    min_level => 'debug',
    filename  => 'logfile.txt',
    stamp_fmt => '%d%H',
  );

This will log to file F<logfile-0813.txt>.

=head1 SEE ALSO

=over 4

=item *

L<Log::Dispatch::File>

=item *

L<POSIX>

=item *

L<Log::Dispatch::File::Rolling>

=item *

L<Log::Dispatch::FileRotate>

=item *

L<Log::Dispatch::FileWriteRotate>

=back

=head1 ACKNOWLEDGEMENTS

=for stopwords Rolsky

Dave Rolsky, author of the Log::Dispatch suite and many other
fine modules on CPAN.

This module was rewritten to respect all present (and future) options to
L<Log::Dispatch::File> by Karen Etheridge, <ether@cpan.org>.

=head1 SUPPORT

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=Log-Dispatch-File-Stamped>
(or L<bug-Log-Dispatch-File-Stamped@rt.cpan.org|mailto:bug-Log-Dispatch-File-Stamped@rt.cpan.org>).

=head1 AUTHORS

=over 4

=item *

Eric Cholet <cholet@logilune.com>

=item *

Karen Etheridge <ether@cpan.org>

=back

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2003 by Eric Cholet and Karen Etheridge.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
