
import future                                                         # The future module holds possible upcoming additions to the standard library

#[

The format of a Nim list comprehension is:

lc[return value | (values to iterate over, any conditions on the iteration), return value type]

This returns a sequence (list) of the return values

]#

echo lc[x*2 | (x <- 1..10), int]                                      # A simple list comprehension that multiplies numbers 1 to 10 by 2

# Output: @[2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

echo lc[x*y | (x <- 1..15, y <- 1..3, y mod 2 == 0), int]             #[ A slightly more complicated example: 'x' in the first range is multiplied by 'y'
                                                                         in the second range, but only where 'y' divided by 2 is zero. So this means only 
# Output: @[2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]      the number 2 is used in the second range ]#

let strings = ["Hello", "World!", "Ignore me"]

echo lc[x | (x <- strings, x != "Ignore me"), string]                 # Filtering a string from a sequence of strings

# Output: @[Hello, World!]
