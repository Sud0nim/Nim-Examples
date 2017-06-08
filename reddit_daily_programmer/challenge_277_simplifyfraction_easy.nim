
# https://www.reddit.com/r/dailyprogrammer/comments/4uhqdb/20160725_challenge_277_easy_simplifying_fractions/

import strutils

proc stringsToIntegers(input: string): seq =
  var 
    strings = input.split()
    integers = newSeq[int](len(strings))
  for i in 0..strings.high:
    integers[i] = parseInt(strings[i])
  result = integers

while true:
  var
    numbers = stringsToIntegers(readline(stdin))
    largestDivisor = 0
    smallest = min(numbers[0], numbers[1])
  for i in 1..smallest:
    if (numbers[0] mod i == 0) and (numbers[1] mod i == 0):
      largestDivisor = i 
  echo(int(numbers[0] / largestDivisor), " ", int(numbers[1] / largestDivisor))
  
  
