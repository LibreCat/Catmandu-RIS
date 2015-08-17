package Catmandu::Importer::RIS;

use namespace::clean;
use Catmandu::Sane;
use Catmandu::Util qw(:is :array);
use Moo;

with 'Catmandu::Importer';

has sep_char => (is => 'ro', default => sub {'\W+'});

sub generator {
    my ($self) = @_;
    sub {
        state $fh = $self->fh;
        state $sep_char = $self->sep_char;
        state $pattern  = qr/$sep_char/;
        state $line;
        state $data;
        my $previous_key= '';
        while($line = <$fh>) {

            chomp($line);
            next if $line eq '';
            # Remove BOM
            $line =~ s/^\x{feff}//;
            $line =~ s/^\s\s/$previous_key/;

            my ($key,$val) = split($pattern,$line,2);

            if ($key eq 'ER') {
                my $tmp = $data;
                $data = {};
                return $tmp;
            }
            else {
                $previous_key = $key;
                $val =~ s/\r// if defined $val;
                # handle repeated fields
                if ($data->{$key}) {
                  $data->{$key} = [ grep { is_string $_ } @{$data->{$key}} ] if is_array_ref $data->{$key};
                	$data->{$key} = [ $data->{$key} ] if is_string $data->{$key};
                  push @{$data->{$key}}, $val;
                } else {
                  $data->{$key} = $val;
                }
            } 
        }
        return;
    };
}

1;

__END__
=head1 NAME

Catmandu::Importer::RIS - a RIS importer

=head1 SYNOPSIS

Command line interface:

  catmandu convert RIS < input.txt

In Perl code:

  use Catmandu::Importer::RIS;

  my $importer = Catmandu::Importer::RIS->new(file => "/foo/bar.txt");

  my $n = $importer->each(sub {
    my $hashref = $_[0];
    # ...
  });

=head1 CONFIGURATION

=over

=item sep_char

Set a field separator

=back

=head1 METHODS

=head2 new(file => $filename, fh => $fh , fix => [...])

Create a new RIS importer for $filename. Use STDIN when no filename is given.

The constructor inherits the fix parameter from L<Catmandu::Fixable>. When given,
then any fix or fix script will be applied to imported items.

=head2 count

=head2 each(&callback)

=head2 ...

Every L<Catmandu::Importer> is a L<Catmandu::Iterable> all its methods are
inherited.

=head1 SEE ALSO

L<Catmandu::Iterable>

=cut
