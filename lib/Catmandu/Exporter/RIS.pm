package Catmandu::Exporter::RIS;

our $VERSION = '0.13';

use namespace::clean;
use Catmandu::Sane;
use Moo;

with 'Catmandu::Exporter';

my $TAGS = [qw(TY A1 A2 A3 A4 AB AD AN AU AV BT C1 C2 C3 C4 C5 C6 C7 C8 CA CN
            CP CT CY DA DB DO DP ED EP ET ID IS J1 J2 JA JF JO KW L1 L2 L3 L4
            LA LB LK M1 M2 M3 N1 N2 NV OP PB PP PY RI RN RP SE SN SP ST T1 T2
            T3 TA TI TT U1 U2 U3 U4 U5 UR VL VO Y1 Y2)];

my $SMALL_TAG = qr/A2|AU|ED|EP|KW|PB|SP/;

sub add {
    my ($self, $data) = @_;
    my $fh = $self->fh;

    for my $tag (@$TAGS) {
        if (my $vals = $data->{$tag}) {
            $vals = [$vals] unless ref $vals;
            for my $val (@$vals) {
                $val = substr($val, 255) if length($val) > 255 && $tag =~ $SMALL_TAG;
                print $fh "$tag  - $val\r\n";
            }
        }
    }

    print $fh "ER  - \r\n";
}

1;

__END__

=pod

=head1 NAME

Catmandu::Exporter::RIS - a RIS exporter

=head1 SYNOPSIS

    use Catmandu::Exporter::RIS;

    my $exporter = Catmandu::Exporter::RIS->new(fix => 'myfix.txt');

    $exporter->add_many($arrayref);
    $exporter->add_many($iterator);
    $exporter->add_many(sub { });

    $exporter->add($hashref);

    $exporter->add({
     TI   => 'the Zen of CSS design',
     AU   => ['Dave Shea','Molley E. Holzschlag'],
     IS   => '0-321-30347-4'
    });

    printf "exported %d objects\n" , $exporter->count;

=head1 DESCRIPTION

The RIS exporter requires as input a Perl hash (or a fix) containing RIS
fields and values as a string or array reference.

=head1 SUPPORTED FIELDS

  TY ID T1 TI CT T2 BT T3 A1 AU A2 ED A3 Y1 PY Y2 N1 AB N2 KW RP
  JF JO JA J1 J2 VL IS CP SP EP CY PB SN AD AV M1 M2 M3 U1 U2 U3 U4 U5
  UR L1 L2 L3 L4

=head1 SEE ALSO

L<Catmandu::Exporter>

=cut