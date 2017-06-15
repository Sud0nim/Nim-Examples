include strutils

var 
  input1 = "I heard the pastor sing live verses easily."
  input2 = "Deep episodes of Deep Space Nine came on the television only after the news."
  input3 = "Digital alarm clocks scare area children."

proc joinable(a,b: string): string =
  for i in 0..a.high:
    for j in countdown(b.high, 0):
      if a[i..a.high] == b[0..j]:
        result = b[j + 1..b.high]


proc recombobulate(input: string): string =
  var sentence = input.split()
  for n in 0..sentence.high:
    if n == 0:
      result = sentence[n]
    elif result.joinable(sentence[n]) != nil:
      result &= result.joinable(sentence[n])
    else:
      result &= " " & sentence[n]

echo recombobulate(input1)
echo recombobulate(input2)
echo recombobulate(input3)

