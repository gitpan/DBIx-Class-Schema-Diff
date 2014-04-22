
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Simple Diffing of DBIC Schemas",
  "AUTHOR" => "Henry Van Styn <vanstyn\@cpan.org>",
  "BUILD_REQUIRES" => {
    "DBIx::Class::Core" => 0,
    "DBIx::Class::Schema" => 0,
    "FindBin" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "aliased" => 0,
    "base" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "DBIx-Class-Schema-Diff",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "DBIx::Class::Schema::Diff",
  "PREREQ_PM" => {
    "Array::Diff" => 0,
    "Data::Dumper::Concise" => 0,
    "Hash::Layout" => 0,
    "JSON" => 0,
    "List::MoreUtils" => 0,
    "List::Util" => 0,
    "Module::Runtime" => 0,
    "Moo" => 0,
    "Moo::Role" => 0,
    "Path::Class" => 0,
    "Scalar::Util" => 0,
    "Try::Tiny" => 0,
    "Types::Standard" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.00",
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



