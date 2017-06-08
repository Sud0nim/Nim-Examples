
# https://www.reddit.com/r/dailyprogrammer/comments/67dxts/20170424_challenge_312_easy_l33tspeak_translator/

import strutils, tables

let swapPairs = {
    "a": "4",
    "b": "6",
    "e": "3",
    "i": "1",
    "l": "1",
    "m": "(V)",
    "n": r"(\)",
    "o": "0",
    "s": "5",
    "t": "7",
    "v": r"\/",
    "w": "`//",
}.toTable

proc checkIfL33t(sentence: string): bool =
  for letter, number in swapPairs:
    if number in sentence:
      return true
  return false

while true:
  var test = toLowerAscii(readline(stdin))
  if checkIfL33t(test):
    for letter, number in swapPairs:
      test = replace(test, number, letter)
  else:
    for letter, number in swapPairs:
      test = replace(test, letter, number)
      
  test = capitalizeAscii(test)

  echo test
  
