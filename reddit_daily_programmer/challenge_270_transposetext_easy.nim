
# https://www.reddit.com/r/dailyprogrammer/comments/4msu2x/challenge_270_easy_transpose_the_input_text/

proc transposeText*(filename: string) =
  var
    maxLength = 0
    lines = newSeq[string](0)
    paddedLines = newSeq[string](0)
    text = open(filename)
    emptyLine = ""
  while endOfFile(text) != true:
    lines.add(readline(text))
  close(text)
  for line in lines:
    if len(line) > maxLength:
      maxLength = len(line)
  for i in 0..<maxLength:
    emptyLine &= " "
  for line in lines:
    var newLine = emptyLine
    for i in line.low..line.high:
      newLine[i] = line[i]
    paddedLines.add(newLine)
  for i in 0..<maxLength:  
    for line in paddedLines:
      stdout.write line[i]
    echo ""

transposeText("sample.txt")

