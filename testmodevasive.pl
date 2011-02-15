#!/usr/bin/env perl

# From Ivan Kristianto's blog
# http://www.ivankristianto.com/web-development/server/1540/
 
use IO::Socket;
use strict;

die "Usage: $ARGV[0] <host>\n" unless ($#ARGV != 1);
my $host = "$ARGV[0]:80";

for(0..1000) {
	my($response);
	my($SOCKET) = new IO::Socket::INET(
		Proto => "tcp",
		PeerAddr => $host
	);

	if (!defined $SOCKET) { die $!; }

	print $SOCKET "GET /?$_ HTTP/1.0\n\n";

	$response = <$SOCKET>;
	print $response;

	close($SOCKET);
}
