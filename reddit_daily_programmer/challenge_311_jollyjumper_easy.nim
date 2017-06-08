
# https://www.reddit.com/r/dailyprogrammer/comments/65vgkh/20170417_challenge_311_easy_jolly_jumper/

import strutils, math

proc stringsToIntegers(input: string): seq =
  var strings = input.split()
  var integers = newSeq[int](len(strings))
  for i in 0..strings.high:
    integers[i] = parseInt(strings[i])
  result = integers

while true:
  var input = readline(stdin)
  var numbers = stringsToIntegers(input)
  var expectedSum = fac(numbers[0] - 1)
  var actualSum = 0
  for i in 1..numbers[0]:
    if i > 1:
      var diff = numbers[i] - numbers[i - 1]
      actualSum += abs(diff)
  if actualSum != expectedSum:
    echo(numbers, " NOT JOLLY")
  else:
    echo(numbers, " JOLLY")

