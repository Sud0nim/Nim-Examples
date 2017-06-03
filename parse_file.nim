# Parse a file and use the data (such as a text file or csv)

#[ 

data.txt contents:

Count,Sum
10,50,
20,400,
1,20,
33,99

 ]#

import parsecsv, strutils, os

var parser: CsvParser                                 # A CsvParser object must first be created
var i = 0
parser.open("data.txt")
parser.readHeaderRow()                                # The readHeaderRow function saves the column headers to a list that can be referenced
                                                      # using the column number

while parser.readRow():                               # Until the end of the file is reached...
  i += 1                                              # For each row, add 1 to i so that it acts as a row counter
  var average = parseFloat(parser.rowEntry("Sum")) /  # Multi-line expressions are OK as long as they are separated by the appropriate operator
    parseFloat(parser.rowEntry("Count"))              # Here we are calculating a simple average for each row
  stdout.write i, ". "                                # If we don't want a new line, then 'stdout.write' can be used instead of 'echo'
  for col in items(parser.headers):
    stdout.write col, ":", parser.rowEntry(col), " "  # The header columns can be referenced from the headers sequence of our CsvParser object
  stdout.write "Average: ", average, "\n"             # A new line can always be added manually when we are ready
parser.close()                                        # The file is closed explicitly once finished with

#[ 

Output:

1. Count:10 Sum:50 Average: 5.0
2. Count:20 Sum:400 Average: 20.0
3. Count:1 Sum:20 Average: 20.0
4. Count:33 Sum:99 Average: 3.0

 ]#
