

import math

proc simple*(principal, rate, periods: float; interestOnly: bool = false): float =
  var futureValue = principal * (1 + rate * periods)
  if interestOnly == true:
    return futureValue - principal
  else:
    return futureValue

proc compound*(principal, rate, compoundsPerPeriod, periods: float; interestOnly: bool = false): float =
  var futureValue = principal * pow((1 + rate / compoundsPerPeriod), compoundsPerPeriod * periods)
  if interestOnly == true:
    return futureValue - principal
  else:
    return futureValue

# Examples:

# echo "Interest and principal: ", compound(100000, 0.05, 12, 10) <- $100,000 compounded monthly at 5% p.a for 10 years

# echo "Interest only: ", compound(100000, 0.05, 12, 10, interestOnly = true) <- the interest component of the above calculation

# echo "Simple interest with principal: ", simple(100000, 0.05, 10) <- $100,000 at 5% p.a for 10 years with no compounding

# echo "Simple interest only: ", simple(100000, 0.05, 10, interestOnly = true) <- the interest component of the above calculation
