#!/usr/bin/perl

use warnings;
use strict;
use LWP::Simple;
use LWP::UserAgent;  # overcome gzipped pages
use HTTP::Request;
use HTML::LinkExtor;


my $baseurl = shift;

my $ua = LWP::UserAgent->new();  # using this ua will force non-gzipped pages
my $req = HTTP::Request->new(GET => $baseurl);

my $parser = HTML::LinkExtor->new(\&pushlinks, $baseurl);

my @links = ();
my $tag_name = shift;
my $attr_name = $tag_name eq "a" ? "href" : $tag_name eq "img" ? "src" : undef;

sub pushlinks {
	my($tag, %attr) = @_;
	return if $tag ne $tag_name;
	push(@links, $attr{$attr_name});
}

my $content = $ua->request($req)->decoded_content;  # decode from UTF-8
$parser->parse($content);

print join("\n", @links), "\n";
