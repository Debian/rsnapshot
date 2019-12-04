#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

use strict;
use Test::More tests => 1;
use SysWrap;

# check for basic configtest
ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//configtest/conf/configtest.conf configtest"));
