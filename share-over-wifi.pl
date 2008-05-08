#!/usr/bin/perl

sub x ($);

$ATH = $ARGV[0];
$ETH = $ARGV[1];
    
$WIF     = "wifi0";
$NAME    = "bvk";
$GATEWAY = "10.11.12.1";
$NETMASK = "255.255.255.0";

unless ($ATH && $ETH) {
    print STDERR "usage: shared-ap ath0 eth0\n";
    exit 1;
}

x "wlanconfig $ATH destroy", 1;
x "wlanconfig $ATH create wlandev $WIF wlanmode ap";
x "iwconfig $ATH essid $NAME";
x "ifconfig $ATH inet $GATEWAY netmask $NETMASK";
x "ifconfig $ATH up";

x "dhcpd3 $ATH";
x "echo 1 > /proc/sys/net/ipv4/ip_forward";
x "iptables -t nat -A POSTROUTING -o $ETH -j MASQUERADE";

exit 0;

sub x ($) {
    my $cmd = shift;
    my $ignore = shift;

    print STDOUT "$cmd\n";
    my $out = `$cmd`;

    if ($? && $ignore) {
	print STDERR "failed: $cmd\n";
	exit 1;
    }
    sleep 1;
}
