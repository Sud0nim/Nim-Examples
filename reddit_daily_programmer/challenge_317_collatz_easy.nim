
# https://www.reddit.com/r/dailyprogrammer/comments/6e08v6/20170529_challenge_317_easy_collatz_tag_system/

import strutils

var input = "aaaaaaa"

while len(input) > 1:
  if startsWith(input, 'a'):
    input = input & "bc"
  elif startsWith(input, 'b'):
    input = input & "a"
  elif startsWith(input, 'c'):
    input = input & "aaa"
  input = input[2..input.high]
  echo input

  
