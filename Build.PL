#!/usr/bin/env perl

use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
	build_requires => {
		'Test::Compile' => 0,
		'Test::Pod' => 0,
	},
	# Module::Build's automatic abstract inference from =head1 NAME -> "Foo - Bar"
	# does not work for distributions whose name contains a - (dash). We
	# therefore set the abstract manually.
	dist_abstract => 'Publish multiple MQTT messages at once',
	dist_name => 'mqtt-multipub',
	dist_version_from => 'bin/mqtt-multipub',
	license => 'perl',
	requires => {
		'perl' => '5.20.0',
		'File::Slurp' => 0,
		'Getopt::Long' => 0,
		'Net::MQTT::Simple' => 0,
		'Time::HiRes' => 0,
	},
	sign => 1,
);
$build->create_build_script();
