
# words.txt is a list of all English words

import parsecsv, algorithm
 
iterator letters(s: string): char =
  let size = len(s)
  for i in 0..<size:
    yield s[i]

var parser: CsvParser

while true:
  parser.open("words.txt")
  parser.readHeaderRow() 
  var
    word = readline(stdin)
    characters = newSeq[char](len(word))
  for letter in letters(word):
    characters.add(letter)
  sort(characters, system.cmp[char])
  while parser.readRow():
    for col in items(parser.headers):
      var
        dictEntry = parser.rowEntry(col)
        letters = newSeq[char](len(word))
      if len(dictEntry) == len(word):
        for i in letters(dictEntry):
          letters.add(i)
        sort(letters, system.cmp[char])
        if letters == characters:
          echo(dictEntry, " <- Found!")
  parser.close()

