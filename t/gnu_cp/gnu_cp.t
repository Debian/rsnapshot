#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

use strict;
use Test::More tests => 2;
use SysWrap;

# make sure snapshot_root directory does not exist before we start
ok(! remove_snapshot_root(),
	" snapshot root does not exist before testing starts");

# check for GNU cp
my @lines = `/bin/cp --help | grep -i 'gnu'`;

SKIP: {
	skip('GNU cp not found', 1) if (@lines == 0);

	ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//gnu_cp/conf/gnu_cp.conf hourly 2>&1"));
}
