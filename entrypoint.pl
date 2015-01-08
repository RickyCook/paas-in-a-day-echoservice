#!/usr/bin/perl -w

use strict;
use IO::Socket;

if ($ARGV[0] eq 'ci') {
    print "Ain't nobody here but us chickens\n";
    exit 0;

} elsif ($ARGV[0] eq 'run') {
    my $sock = new IO::Socket::INET (
        LocalPort => '7000',
        Proto => 'tcp',
        Listen => 1,
        Reuse => 1,
    );
    die "Could not create socket: $!\n" unless $sock;

    print "Entering event loop\n";
    while(1) {
        my $conn = $sock->accept();
        while(<$conn>) {
            $conn->write($_);
        }
    }
    exit 0;

} else {
    die "I don't know how to ${ARGV[0]}\n";
}
