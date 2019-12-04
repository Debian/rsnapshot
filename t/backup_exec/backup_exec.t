#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

use strict;
use Test::More tests => 2;
use SysWrap;

# Ensure passing behavior
ok(2 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//backup_exec/conf/backup_exec.conf hourly"));
# Ensure failing behavior
ok(1 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//backup_exec/conf/backup_exec_fail.conf hourly"));
