#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

use strict;
use Test::More tests => 1;
use SysWrap;

mkdir("/home/travis/build/rsnapshot/rsnapshot//t//support/files/a") unless -d "/home/travis/build/rsnapshot/rsnapshot//t//support/files/a";
execute("cp /home/travis/build/rsnapshot/rsnapshot//t/support/files/template/a/1 /home/travis/build/rsnapshot/rsnapshot//t/support/files/template/a/2 /home/travis/build/rsnapshot/rsnapshot//t//support/files/a/");

ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//rsync/conf/rsync.conf hourly"));

execute("rm -f /home/travis/build/rsnapshot/rsnapshot//t//support/files/a/1 /home/travis/build/rsnapshot/rsnapshot//t/support/files/a/2");
