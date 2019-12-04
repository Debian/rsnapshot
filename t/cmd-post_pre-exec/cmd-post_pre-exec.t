#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

# Testing: Only pass test, if both cmd_preexec and cmd_postexec succeeds and the exit-code matches

use strict;
use Test::More tests => 4;
use SysWrap;

ok(0 != rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//cmd-post_pre-exec/conf/pre-false-post-false.conf hourly"));
ok(0 != rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//cmd-post_pre-exec/conf/pre-false-post-true.conf hourly"));
ok(0 != rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//cmd-post_pre-exec/conf/pre-true-post-false.conf hourly"));
ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//cmd-post_pre-exec/conf/pre-true-post-true.conf hourly"));
