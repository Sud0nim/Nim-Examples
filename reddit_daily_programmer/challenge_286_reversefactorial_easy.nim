
# https://www.reddit.com/r/dailyprogrammer/comments/55nior/20161003_challenge_286_easy_reverse_factorial/

proc reverseFactorial(num: int) =
  var
    divisor = 1.0
    number = float(num)
  while number != 1.0:
    number /= divisor
    if number == 1:
      echo int(divisor), "!"
      break
    elif divisor > number:
      echo "NONE"
      break
    divisor += 1
  
reverseFactorial(120)

