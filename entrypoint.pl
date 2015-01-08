#!/usr/bin/perl -w

use strict;
use IO::Socket;

my $sock = new IO::Socket::INET (
    LocalPort => '7000',
    Proto => 'tcp',
    Listen => 1,
    Reuse => 1,
);
die "Could not create socket: $!\n" unless $sock;

while(1) {
    my $conn = $sock->accept();
    while(<$conn>) {
        $conn->write($_);
    }
}
