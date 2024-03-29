
use strict;
use warnings;

use 5.008007;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Create tickets in OTRS via the Command Line Interface.",
  "AUTHOR" => "Michiel Beijen <michiel.beijen\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-OTRS-CreateTicket",
  "EXE_FILES" => [
    "bin/otrs.CreateTicket.pl"
  ],
  "LICENSE" => "open_source",
  "NAME" => "App::OTRS::CreateTicket",
  "PREREQ_PM" => {
    "Encode" => 0,
    "Getopt::Long" => 0,
    "Pod::Usage" => 0,
    "SOAP::Lite" => 0,
    "Time::Piece" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0
  },
  "VERSION" => "1.14",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Encode" => 0,
  "File::Spec" => 0,
  "Getopt::Long" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Pod::Usage" => 0,
  "SOAP::Lite" => 0,
  "Test::More" => 0,
  "Time::Piece" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



