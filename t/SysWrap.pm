package SysWrap;

use strict;
use warnings FATAL => 'all';
use Exporter 'import';

our $VERSION = '1.0';

our @EXPORT = qw(execute rsnapshot remove_snapshot_root rsnapshot_output);

sub remove_snapshot_root {
	my $args = shift(@_);
	my $snapshot_root;

	if(defined $args && $args ne ""){
		$snapshot_root = $args;
	}
	else {
		$snapshot_root = "/home/travis/build/rsnapshot/rsnapshot//t/support/snapshots";
	}

	if(-d "$snapshot_root"){
	 return execute("rm -rf \"$snapshot_root\"");
	}
}

sub execute {
	return system(@_) >> 8;
}

sub rsnapshot {
	my $args = shift(@_);

	return execute("/home/travis/perl5/perlbrew/perls/5.18/bin/perl /home/travis/build/rsnapshot/rsnapshot//rsnapshot $args >/dev/null 2>&1");
}

sub rsnapshot_output {
	my $args = shift(@_);
	return `/home/travis/perl5/perlbrew/perls/5.18/bin/perl /home/travis/build/rsnapshot/rsnapshot//rsnapshot $args`;
}

1;
