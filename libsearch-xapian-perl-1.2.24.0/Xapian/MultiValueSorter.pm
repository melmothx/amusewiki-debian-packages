package Search::Xapian::MultiValueSorter;

use 5.006;
use strict;
use warnings;

require DynaLoader;

our @ISA = qw(DynaLoader);

# Preloaded methods go here.

# In a new thread, copy objects of this class to unblessed, undef values.
sub CLONE_SKIP { 1 }

sub new() {
  my $class = shift;
  my $obj = new0();

  bless $obj, $class;
  foreach (@_) { $obj->add($_) }

  return $obj;
}

1;

__END__

=head1 NAME

Search::Xapian::MultiValueSorter - allows sorting by a several values.

=head1 DESCRIPTION

Results are ordered by the first value.  In the event of a tie, the
second is used.  If this is the same for both, the third is used, and
so on.

=head1 SYNOPSIS

  use Search::Xapian;

  my $db = new Search::Xapian::Database("/path/to/db");
  my $enq = new Search::Xapian::Enquire($db);
  my $sorter = new Search::Xapian::MultiValueSorter(1, 3, 5);
  $enq->set_sort_by_key($sorter);

=head1 METHODS

=over 4

=item new [<value>...]

Construct and add the values listed.

=item add <value> [<forward>]

Add another value to sort on.  By default, values sort forwards, unless forward
is specified and is false.

=back

=head1 REFERENCE

  https://xapian.org/docs/sourcedoc/html/classXapian_1_1MultiValueSorter.html

=cut
