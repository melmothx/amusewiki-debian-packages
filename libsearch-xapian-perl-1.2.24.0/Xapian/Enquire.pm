package Search::Xapian::Enquire;

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader);

# Preloaded methods go here.

# In a new thread, copy objects of this class to unblessed, undef values.
sub CLONE_SKIP { 1 }

sub set_query {
  my $self = shift;
  my $query = shift;
  if( ref( $query ) ne 'Search::Xapian::Query' ) {
    $query = Search::Xapian::Query->new( $query, @_ );
    $self->set_query1( $query );
    return;
  }
  my $nargs = scalar(@_);
  if( $nargs > 1) {
    Carp::carp( "USAGE: \$enquire->set_query(\$query) or \$enquire->set_query(\$query, \$length)" );
    exit;
  }
  if( $nargs == 0 ) {
    $self->set_query1( $query );
  } else {
    $self->set_query2( $query, shift );
  }
}

sub get_mset {
  my $self = shift;
  my $nargs = scalar(@_);
  if( $nargs == 3 ) {
    my $type = ref( $_[2] );
    if ( $type eq 'CODE' ) {
      # get_mset(first, max, matchdecider) [perl extra]
      return $self->get_mset2(@_);
    }
    if ( $type eq 'Search::Xapian::RSet' ) {
      # get_mset(first, max, rset)
      splice @_, 2, 0, (0); # insert checkatleast
    }
  } elsif( $nargs == 4 && ref( $_[3] ) eq 'CODE' ) {
    # get_mset(first, max, rset, matchdecider)
    splice @_, 2, 0, (0); # insert checkatleast
  }
  return $self->get_mset1( @_ );
}

sub matches {
  my $self = shift;
  return $self->get_mset(@_)->items();
}

sub get_matching_terms_begin {
  my $self = shift;
  if( scalar(@_) == 1 ) {
    my $arg = shift;
    my $arg_class = ref( $arg );
    if( $arg_class eq 'Search::Xapian::MSetIterator' ) {
      return $self->get_matching_terms_begin2($arg);
    } else {
      return $self->get_matching_terms_begin1($arg);
    }
  }
  Carp::carp( "USAGE: \$enquire->get_matching_terms_begin(\$docid) or \$enquire->get_matching_terms_begin(\$msetiterator)" );
  exit;
}

sub get_matching_terms_end {
  my $self = shift;
  if( scalar(@_) == 1 ) {
    my $arg = shift;
    my $arg_class = ref( $arg );
    if( $arg_class eq 'Search::Xapian::MSetIterator' ) {
      return $self->get_matching_terms_end2($arg);
    } else {
      return $self->get_matching_terms_end1($arg);
    }
  }
  Carp::carp( "USAGE: \$enquire->get_matching_terms_end(\$docid) or \$enquire->get_matching_terms_end(\$msetiterator)" );
  exit;
}

1;

__END__

=head1 NAME

Search::Xapian::Enquire - Make queries against a database

=head1 DESCRIPTION

This class provides an interface to the information retrieval system for the
purpose of searching.

=head1 METHODS

=over 4

=item new

=item set_query

takes either a ready made L<Search::Xapian::Query> or a scalar containing
a query, which in that case will be passed to L<Search::Xapian::Query>'s
constructor, together with any other passed arguments.

=item set_query_object <query>

=item get_query

=item matches <start> <size> [<check_at_least>]

Takes the start element, and maximum number of elements (and optionally
the minimum number of matches to check), and returns an array tied to
L<Search::Xapian::MSet::Tied>.

=item get_matching_terms_begin

Returns a L<Search::Xapian::TermIterator>, pointing to the start
of the stream.

=item get_matching_terms_end

Returns a L<Search::Xapian::TermIterator>, pointing to the end
of the stream.

=item set_collapse_key <collapse_key>

=item set_docid_order <order>

Set the direction in which documents are ordered by document id
in the returned MSet.

This order only has an effect on documents which would otherwise
have equal rank.  For a weighted probabilistic match with no sort
value, this means documents with equal weight.  For a boolean match,
with no sort value, this means all documents.  And if a sort value
is used, this means documents with equal sort value (and also equal
weight if ordering on relevance after the sort).

order can be ENQ_ASCENDING (the default, docids sort in ascending order),
ENQ_DESCENDING (docds sort in descending order), or ENQ_DONT_CARE (docids sort
in whatever order is most efficient for the backend.)

Note: If you add documents in strict date order, then a boolean
search - i.e. set_weighting_scheme(Search::Xapian::BoolWeight->new())
- with set_docid_order(ENQ_DESCENDING) is a very efficient
way to perform "sort by date, newest first".

=item set_cutoff <percent_cutoff> [<weight_cutoff>]

=item set_sort_by_relevance

Set the sorting to be by relevance only.  This is the default.

=item set_sort_by_value <sort_key> [<ascending>]

Set the sorting to be by value only.

sort_key - value number to reorder on.  Sorting is with a
string compare.  If ascending is true (the default) higher
is better; if ascending is false, lower is better.

ascending - If true, document values which sort higher by
string compare are better.  If false, the sort order
is reversed.  (default true)

=item set_sort_by_value_then_relevance <sort_key> [<ascending>]

Set the sorting to be by value, then by relevance for documents
with the same value.

sort_key - value number to reorder on.  Sorting is with a
string compare.  If ascending is true (the default) higher
is better; if ascending is false, lower is better.

ascending - If true, document values which sort higher by
string compare are better.  If false, the sort order
is reversed.  (default true)

=item set_sort_by_relevance_then_value <sort_key> [<ascending>]

Set the sorting to be by relevance then value.

Note that with the default BM25 weighting scheme parameters,
non-identical documents will rarely have the same weight, so
this setting will give very similar results to
set_sort_by_relevance().  It becomes more useful with particular
BM25 parameter settings (e.g. BM25Weight(1,0,1,0,0)) or custom
weighting schemes.

sort_key - value number to reorder on.  Sorting is with a
string compare.  If ascending is true (the default) higher
is better; if ascending is false, lower is better.

ascending - If true, document values which sort higher by
string compare are better.  If false, the sort order
is reversed.  (default true)

=item set_sort_by_key <sorter> [<ascending>]

Set the sorting to be by key only.

sorter - the functor to use to build the key.

ascending - If true, keys which sort higher by
string compare are better.  If false, the sort order
is reversed.  (default true)

=item set_sort_by_key_then_relevance <sorter> [<ascending>]

Set the sorting to be by key, then by relevance for documents
with the same key.

sorter - the functor to use to build the key.

ascending - If true, keys which sort higher by
string compare are better.  If false, the sort order
is reversed.  (default true)

=item set_sort_by_relevance_then_key <sorter> [<ascending>]

Set the sorting to be by relevance then key.

sorter - the functor to use to build the key.

ascending - If true, keys which sort higher by
string compare are better.  If false, the sort order
is reversed.  (default true)

=item get_mset

Get match set.

=item get_eset <maxitems> <rset> [<decider>]

Get set of query expansion terms.

=item get_description

Return a description of this object.

=item add_matchspy <spy>

Add a matchspy.

This matchspy will be called with some of the documents which match the query, during the match process.

=item clear_matchspies

Remove all the matchspies.

=back

=head1 SEE ALSO

L<Search::Xapian::Query>, L<Search::Xapian::Database>, L<Search::Xapian::MatchSpy>

=cut
