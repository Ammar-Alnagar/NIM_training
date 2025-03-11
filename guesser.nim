import random
import strutils

proc guessNumber(maxNumber: int) =
  randomize()
  let secretNumber = rand(1..maxNumber)
  var guess: int
  var numGuesses = 0
  echo "I'm thinking of a number between 1 and ", maxNumber, "."

  while true:
    echo "Take a guess."
    let input = readLine(stdin)
    
    if parseInt(input, guess):
      numGuesses += 1
      if guess < secretNumber:
        echo "Too low!"
      elif guess > secretNumber:
        echo "Too high!"
      else:
        echo "Congratulations! You guessed it in ", numGuesses, " tries!"
        break
    else:
      echo "Invalid input. Please enter a number."

proc main() =
  echo "Welcome to the Number Guessing Game!"
  echo "What difficulty would you like to play on?"
  echo "1. Easy (1-10)"
  echo "2. Medium (1-50)"
  echo "3. Hard (1-100)"
  let difficulty = readLine(stdin)
  if difficulty == "1":
    guessNumber(10)
  elif difficulty == "2":
    guessNumber(50)
  elif difficulty == "3":
    guessNumber(100)
  else:
    echo "Invalid difficulty. Defaulting to Easy."
    guessNumber(10)

main()

