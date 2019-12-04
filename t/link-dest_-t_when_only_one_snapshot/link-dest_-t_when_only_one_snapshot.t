#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

use strict;
use Test::More tests => 5;
use SysWrap;

# Make sure snap_root directory does not exist before we start
ok(! remove_snapshot_root(),
	" snapshot root does not exist before testing starts");

ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//link-dest_-t_when_only_one_snapshot/conf/link-dest_-t_when_only_one_snapshot.conf daily"),
	" first rsnapshot ran");

ok(-d "/home/travis/build/rsnapshot/rsnapshot//t/support/snapshots/daily.0" && ! -d "/home/travis/build/rsnapshot/rsnapshot//t/support/snapshots/daily.1",
	" daily.0 exists but daily.1 does not");

ok(rsnapshot_output("-c /home/travis/build/rsnapshot/rsnapshot//t//link-dest_-t_when_only_one_snapshot/conf/link-dest_-t_when_only_one_snapshot.conf -t daily") =~ / --link-dest=/,
	" link-dest is used");

ok(0 == remove_snapshot_root(),
	" Removed snapshot root to clean up");
