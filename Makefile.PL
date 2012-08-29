
use strict;
use warnings;



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
    "Getopt::Long" => 0,
    "Pod::Usage" => 0,
    "SOAP::Lite" => 0
  },
  "VERSION" => "1.0.4",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



