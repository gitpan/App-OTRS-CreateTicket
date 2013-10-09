use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.023

use Test::More  tests => 2 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'App/OTRS/CreateTicket.pm'
);

my @scripts = (
    'bin/otrs.CreateTicket.pl'
);

# no fake home requested

use IPC::Open3;
use IO::Handle;

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stdin = '';     # converted to a gensym by open3
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, qq{$^X -Mblib -e"require q[$lib]"});
    waitpid($pid, 0);
    is($? >> 8, 0, "$lib loaded ok");

    if (my @_warnings = <$stderr>)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}

foreach my $file (@scripts)
{ SKIP: {
    open my $fh, '<', $file or warn("Unable to open $file: $!"), next;
    my $line = <$fh>;
    close $fh and skip("$file isn't perl", 1) unless $line =~ /^#!.*?\bperl\b\s*(.*)$/;

    my $flags = $1;

    my $stdin = '';     # converted to a gensym by open3
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, qq{$^X -Mblib $flags -c $file});
    waitpid($pid, 0);
    is($? >> 8, 0, "$file compiled ok");

    if (my @_warnings = grep { !/syntax OK$/ } <$stderr>)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
} }


is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


