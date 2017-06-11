
# https://www.reddit.com/r/dailyprogrammer/comments/pih8x/easy_challenge_1/

import strutils, logging

while true:
  echo "Hi there, what's your name?"
  var name = readline(stdin)
  echo "OK great, and how old are you $1?" % [name]
  var age = readline(stdin)
  if parseFloat(age) < 18:
    echo "Wow, only $1... Now I feel really old =/" % [age]
  else:
    echo "Thanks $1, I remember when I was $2." % [name, age]
  echo "OK one last thing, can you please choose a funny username also?"
  var username = readline(stdin)
  echo "Alright, I think I have everything. Let me just run those details by you again to be sure..."
  echo "Your name is $1, you are $2 years old, and your username is $3" % [name, age, username]
  echo "Was that all correct? (y/n)"
  if readline(stdin) == "y":
    var fL = newFileLogger("user_details.log", fmtStr = verboseFmtStr)
    addHandler(fL)
    info("Name: $1  Age: $2  Username: $3" % [name, age, username])
    break
  echo "OK, in that case let's pretend we haven't met and try again."
  
  
