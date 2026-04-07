#!/usr/bin/env perl
# $Id: syntaxform.pl 914 2024-01-07 21:48:39Z karl $
# Public domain.  Originally written by Karl Berry, 2016.
# Read pdftex.tex and generate pdftex-syntax.tex
# by looking for the primitive descriptions.

use strict; use warnings;

# classes need to be shown in a specific order,
# and have specific text for the headings.
# sorry for using an array. global for simpler sorting.
my %class_info = (
  "integer"            => [1, "Integer registers"],
  "read-only integer"  => [2, "Read-only integers"],
  "dimen"              => [3, "Dimen registers"],
  "tokens"             => [4, "Token registers"],
  "expandable"         => [5, "Expandable commands"],
  "general"            => [6, "General commands"],
);

exit (&main ());

sub main {
  my %primitive = &read_manual_for_primitives ();

  # group primitives into classes based on their \Whatever construct.
  my %class;
  #warn "\n\f\n sorting\n";
  for my $p (sort keys %primitive) {
    #print STDERR "sorting primitive $p...";
    my ($class) = $primitive{$p} =~ /\\Whatever *\{(.*?)\}/;
    # general commands don't have a \Whatever.
    $class = "general" if ! $class;
    #warn "class $class\n";
    
    # append this primitive, comma-separated.
    $class{$class} .= "$p,"
  }
  
  print <<END_HEADER;
% This is the list of new or extended primitives provided by pdftex.
% Don't edit this file, as it is auto-generated from the
% pdfTeX manual source pdftex.tex by the script syntaxform.pl.
% Syntax rule conventions borrowed from `TeXbook naruby' by Petr Olsak.
END_HEADER
  &print_by_class (\%class, \%primitive);
  return 0;
}

{

sub print_by_class {
  my ($class_ref,$primitive_ref) = @_;
  my %class = %$class_ref;  
  
  #warn "\n\f\n printing by class\n";
  for my $c (sort by_class keys %class) {
    #warn "\f printing class $c\n";
    my $aref = $class_info{$c};
    my $heading_name = $class_info{$c}->[1];
    #warn "  heading_name $heading_name\n";
    print <<END_START_CLASS;
\\section{$heading_name}

END_START_CLASS

    # extract list of primitives for this class.
    my @prims = split (/,/, $class{$c});
    for my $p (@prims) {
      my $val = $primitive_ref->{$p};
      #warn "  primitive $p, val $val\n";
      
      # get rid of the \pdftexprimitive{ and trailing }
      $val =~ s,^\\pdftexprimitive *\{,,;
      $val =~ s, *\} *$,,;
      
      # leading \Syntax and trailing } on their own lines for syntaxform.awk.
      $val =~ s,^ *\\Syntax *\{,\\Syntax\{\n,;
      $val =~ s, *\} *$,\n\},;
      
      # collapse multiple spaces
      $val =~ s,  +, ,g;
      
      print "\n$val\n";
    }
  }
}

sub by_class {
  if (! defined ($class_info{$a}->[0])) {
  warn "undef $a $class_info{$a},",  $class_info{$a}->[0], ".\n"; }
#  if (! $class_info{$b}->[0]) { warn "no class info for $b\n"; }
$class_info{$a}->[0] <=> $class_info{$b}->[0]; }

} # end block for %class_info


# read <> for \pdftexprimitive blocks.  Return hash with keys being the
# primitive name (including the leading \) and values the entire block,
# without newlines.
# 
sub read_manual_for_primitives {
  my $printing = 0;
  my $primitive = "";
  my %primitive;

  while (<>) {
    # \pdftexprimitive block ends at next unindented blank or \... line.
    $printing = 0 if /^($|\\)/;
    if (/^\\pdftexprimitive/) {
      $printing = 1;
      
      my $type;
      ($primitive) = m/\\cs *\{(.*?)\}/;
      #warn "$.: found primitive $primitive\n";
      warn "$ARGV:$.: no primitive found in: $_" if (! $primitive);
      $primitive = "\\$primitive";
      
      # Just one case, \special, has multiple instances of \pdftexprimitive.
      # kludge by appending spaces to the name to make it unique;
      # we later reduce multiple spaces to one, so it's not visible.
      $primitive .= " " until ! exists $primitive{$primitive};
    }

    if ($printing) {
      # concatenate lines of definition; assume spacing is reasonable.
      chomp;
      $primitive{$primitive} .= $_;
      #warn "  concatenated $primitive to $primitive{$primitive}\n";
    }
  }
  
  return %primitive;
}
