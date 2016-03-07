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

my @imgs = ();
sub pushlinks {
	my($tag, %attr) = @_;
	return if $tag ne 'img';
	push(@imgs, $attr{src});
}

my $content = $ua->request($req)->decoded_content;  # decode from UTF-8
$parser->parse($content);

print join("\n", @imgs), "\n";
