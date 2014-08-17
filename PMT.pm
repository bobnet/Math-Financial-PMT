package Math::Financial::PMT
use strict;
use warnings;

# RCC 01.05.2002
# function to calculate PMT
# payment amount per interval on loan or annuity of initial value "pv" with payments spread out over "nper" intervals and with interest accruing at "rate" per interval

sub PMT {
  my $rate = shift @_; # rate - yearly interest rate 
  my $nper = shift @_; # nper - payment periods in an annuity  
  my $pv   = shift @_; # pv - principal
  my ($pmt);

  $rate = $rate / 12;
  $nper = $nper * 12;

  if ($rate) {
    if ($nper) {
      if ($pv) {
        $pmt = $pv * $rate/(1 - exp(- $nper * log(1 + $rate)));
        return ($pmt);
      }
    }
  }
  return (0);
}

1;
__END__
