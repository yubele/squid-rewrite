#!/usr/bin/perl

$source_fqdn = 's-engr.com';

while (my $buf = <> ) {
	my @url = split(/\s+/, $buf) ;
	if ( $url[0] =~ m/$source_fqdn/ ){
		$url[0] =~ s/http:\/\/$source_fqdn(.*)/http:\/\/$source_fqdn$1?from=squid/i ;
	}
	print "$url[0]\n" ;
	flush('STDOUT') ;
}

sub flush (*) {
	local($old) = select(shift) ;
	$| = 1 ;
	print '' ;
	$| = 0 ;
	select($old) ;
}
