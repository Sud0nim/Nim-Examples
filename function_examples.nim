
import math, strutils                         # Modules from the standard library are available with the default Nim installation, but must be imported

#[ 

A function or 'proc' is structured as follows:

proc functionName(parameter name: parameter type): return type =
  function body...

 ]#
           
# Example 1                                   # A function is declared with the 'proc' keyword

proc isFibonacci(n: int): bool =              # The scope of a function body is defined by its indentation (of 2 spaces) from the proc keyword
  let a: float = 0.5 + 0.5 * sqrt(5.0)        # 'let' should be used to declare a variable that can not have its value changed once set
  let b = a * float(n)                        # Note that 'n' is cast as a float from an integer, so that it can be used in multiplication with 'a' which is of float type
  return abs(round(b) - b) < 1.0 / float(n)   # The return feature may be familiar from other languages, but Nim has alternative syntax to return a value also

for i in 0..20:                               # The .. range syntax is intuitive, but be aware that it is inclusive of the ending value in the range (20)
  if isFibonacci(i):                       
    echo i, " is a Fibonacci number!"         # The echo statement can print multiple variable types in one call, and automatically creates a new line afterwards
  elif not isFibonacci(i):                    # Nim uses the shortened 'elif' syntax rather than the longer 'else if'
    echo i, " is not a Fibonacci number."


# Example 2                                   # A function assigning a value to result instead of using the return keyword                                     

proc isFibonacciNumber(n: int): bool =      
  let a: float = 0.5 + 0.5 * sqrt(5.0)      
  let b = a * float(n)                        
  result = abs(round(b) - b) < 1.0 / float(n) # Nim has an implicit 'result' variable in each function, and can be used as an alternative to the return keyword
                                              # it is idiomatic in Nim to use the result variable unless 'return' is required for control-flow

echo "Check your own number..."

while true:
  echo "Please enter a number to check if it is in the Fibonacci sequence, or 0 to quit..."
  var userNumber = parseInt(readLine(stdin))  # 'var' should be used to declare a variable that might need to have its value change within the program
  if isFibonacciNumber(userNumber):
    echo userNumber, " is a Fibonacci number!" 
  else:                                       # 'else' syntax is just the same as in most other languages
    echo userNumber, " is not a Fibonacci number."
  if userNumber == 0:
    break


# Example 3                                   # A function with no explicit return or result, but where the last evaluated statement is returned.   

proc isFib(n: int): bool =      
  let a: float = 0.5 + 0.5 * sqrt(5.0)      
  let b = a * float(n)                      
  abs(round(b) - b) < 1.0 / float(n)          # 'return' or 'result =' are only required if you wish to leave the function early, otherwise the last line is returned

let fibArray = [0, 1, 2, 3, 5, 8, 13]

echo "Checking fibArray matches the Fibonacci sequence..."

for i in low(fibArray)..high(fibArray):       # Despite no return explicitly declared, the last evaluated expression is returned
  echo fibArray[i], " is a Fibonacci number? ", isFib(fibArray[i])
