
# https://www.reddit.com/r/dailyprogrammer/comments/6melen/20170710_challenge_323_easy_3sum/

import strutils, sequtils, algorithm

proc print_triplet(user_input: string) =
  var
    input = user_input.split()
    n = len(input)
    numbers = input.map(proc(x: string): int = x.parse_int)
    triplets = new_seq_with(0, new_seq[int](0))
  numbers.sort(system.cmp[int])
  for i in 0..n-3:
    var 
      a = numbers[i]
      start = i+1
      finish = n-1
    while (start < finish):
       var b = numbers[start]
       var c = numbers[finish]
       if a + b + c == 0:
        var new_triplet = @[a, b, c]
        var exists = false
        for j in triplets:
          if new_triplet[0] in j and new_triplet[1] in j and new_triplet[2] in j:
            exists = true
            break
        if exists == false:
          echo(a, " ", b, " ", c)
          triplets.add(new_triplet)
        finish -= 1
       elif a + b + c > 0:
          finish -= 1
       else:
          start += 1

echo "Example Input:"
print_triplet("9 -6 -5 9 8 3 -4 8 1 7 -4 9 -9 1 9 -9 9 4 -6 -8")
echo "Input 1:"
print_triplet("4 5 -1 -2 -7 2 -5 -3 -7 -3 1")
echo "Input 2:"
print_triplet("-1 -6 -3 -7 5 -8 2 -8 1")
echo "Input 3:"
print_triplet("-5 -1 -4 2 9 -9 -6 -1 -7")


#[ 

Outputs:

Example Input:
-9 1 8
-8 1 7
-5 -4 9
-5 1 4
-4 -4 8
-4 1 3
Input 1:
-7 2 5
-5 1 4
-3 -2 5
-3 -1 4
-3 1 2
Input 2:
-7 2 5
-6 1 5
-3 1 2
Input 3:
-5 -4 9
-1 -1 2

]#


