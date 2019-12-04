#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

use strict;
use Test::More tests => 2;
use SysWrap;

# make sure snap_root directory does not exist before we start
ok(! remove_snapshot_root(),
	" snapshot root does not exist before testing starts");

SKIP: {
	my $ssh_test = "/usr/bin/ssh -p 22 -o StrictHostKeyChecking=no travis\@localhost true";
	my $cant_ssh = system("$ssh_test");
	skip("Cant SSH with \"$ssh_test\"", 1) if ($cant_ssh);
	ok(!rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//ssh_args/conf/ssh_args.conf hourly"), "ssh_args parsed");
}
