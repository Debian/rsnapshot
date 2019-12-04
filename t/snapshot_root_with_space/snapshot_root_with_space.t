#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

use strict;
use Test::More tests => 5;
use SysWrap;

my $snap_root="/home/travis/build/rsnapshot/rsnapshot//t//support/snapshots space root";
# Make sure snap_root directory does not exist before we start
ok(! remove_snapshot_root($snap_root),
	" snapshot root does not exist before testing starts");

ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//snapshot_root_with_space/conf/snapshot_root_with_space.conf hourly"),
	" first rsnapshot ran");
ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//snapshot_root_with_space/conf/snapshot_root_with_space.conf hourly"),
	" second rsnapshot ran");

ok(-d "$snap_root/hourly.0" && -d "$snap_root/hourly.1",
	" hourly.0 and hourly.1 directories exist afterward");

ok(0 == execute("rm -rf \"$snap_root\""),
	" Removed snapshot root to clean up");
