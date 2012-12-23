use inc::Module::Install;
use lib 'lib';
use Task::DWIM::XML;

name           'Task-DWIM-XML';
all_from       'lib/Task/DWIM/XML.pm';
#build_requires 'Test::More'                => '0.42';
#build_requires 'File::Spec'                => '0.80';

requires perl  => 5.008;

my %modules = Task::DWIM::XML::get_modules();
foreach my $name (keys %modules) {
    requires $name => $modules{$name};
}

repository 'https://github.com/dwimperl/Task-DWIM';

WriteAll;


