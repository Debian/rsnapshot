#!/home/travis/perl5/perlbrew/perls/5.18/bin/perl

use strict;
use Test::More tests => 7;
use SysWrap;

# copy files into place
mkdir("/home/travis/build/rsnapshot/rsnapshot//t//support/files/a") unless -d "/home/travis/build/rsnapshot/rsnapshot//t//support/files/a";
ok(0 == execute("cp /home/travis/build/rsnapshot/rsnapshot//t/support/files/template/a/1 /home/travis/build/rsnapshot/rsnapshot//t/support/files/template/a/2 /home/travis/build/rsnapshot/rsnapshot//t//support/files/a/"));

# run rsnapshot once to copy the files into the snapshot root
ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//rsync/conf/rsync.conf hourly"));

# now remove a file from the source
ok(0 == execute("rm -f /home/travis/build/rsnapshot/rsnapshot//t//support/files/a/1"));

# run rsnapshot again, it _should_ delete the "1" file
ok(0 == rsnapshot("-c /home/travis/build/rsnapshot/rsnapshot//t//relative_delete_bugfix/conf/relative_delete_bugfix.conf hourly"));

my $path_to_check = '/home/travis/build/rsnapshot/rsnapshot//t//support/snapshots/hourly.0/localhost//home/travis/build/rsnapshot/rsnapshot//t//support/files/a/';

# make sure the file was --deleted
ok( ! -e "$path_to_check/1" );

# make sure the other one is still there
ok(   -e "$path_to_check/2" );

# clean up
ok(0 == execute("rm -f /home/travis/build/rsnapshot/rsnapshot//t//support/files/a/1 /home/travis/build/rsnapshot/rsnapshot//t//support/files/a/2"));
