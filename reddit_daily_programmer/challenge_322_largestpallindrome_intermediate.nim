
# https://www.reddit.com/r/dailyprogrammer/comments/6ldv3m/20170705_challenge_322_intermediate_largest/

import strutils except to_lower
import unicode, math

proc is_pallindrome(text: string): bool =
  if to_lower(text) == to_lower(reversed(text)):
    return true
  return false

proc largest_factor(text: string): int =
  let number = parse_float(text)
  int(10.pow(number)) - 1

proc largest_pallindrome(text: string): int =
  let
    max_factor = largest_factor(text)
    min_factor = int(10.pow(parse_float(text) - 1))
  var result, number = 0
  for i in countdown(max_factor, min_factor):
    for j in countdown(max_factor, min_factor):
      number = i * j
      if number < result:
        break
      if is_pallindrome($number):
        result = number
  return result

for i in 1..8:
  echo largest_pallindrome($i)

