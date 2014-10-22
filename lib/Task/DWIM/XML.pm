package Task::DWIM::XML;

use 5.008;
use strict;
our $VERSION = '0.06';

my %modules;

sub get_modules {
    read_modules('Catalyst.txt');
    read_modules('Dancer.txt');
    read_modules('Database.txt');
    read_modules('DateTime.txt');
    read_modules('DistZilla.txt');
    read_modules('modules.txt');
    read_modules('Moose.txt');
    read_modules('Spreadsheet.txt');
    read_modules('Test.txt');
    read_modules('XML.txt');
    #read_modules('tasks.txt');
    if ($^O eq 'MSWin32') {
        read_modules('Windows.txt');
    } else {
        read_modules('nowindows.txt');
    }

    return %modules;
}

sub read_modules {
    my ($file) = @_;

    my $file = "lists/$file";

    return if not -e '.git' and not -e $file;

    open my $fh, '<', $file or die "Could not open '$file' $!";
    while (my $line = <$fh>) {
        chomp $line;
        next if $line =~ /^\s*(#.*)?$/;
        $line =~ s/\s*#.*//;
        my ($name, $version) = split /\s*=\s*/, $line;
        die "No version in '$line'" if not defined $version;
        if (exists $modules{$name}) {
            die "Module '$name' has 2 entries. One with '$modules{$name}' and the other one with '$version'";
        }
        $modules{$name} = $version;
    }
    close $fh;
    return;
}


1;

__END__

=pod

=head1 NAME

Task::DWIM::XML - A Task module for DWIM Perl L<http://dwimperl.com/>

=head1 DESCRIPTION

Just a list of modules to be installed as part of the DWIM Perl distribution

=head1 AUTHOR

Gabor Szabo E<lt>szabgab@cpan.orgE<gt>

If you are interested, contact me to take over the maintenance.

=head1 SEE ALSO

L<Task>, L<http://dwimperl.com/>

=head1 COPYRIGHT

Copyright 2012 Gabor Szabo.

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut

