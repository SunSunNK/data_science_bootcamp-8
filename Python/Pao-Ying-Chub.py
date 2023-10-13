import random

def pao_ying_chub():
  """
  Plays the Pao Ying Chub game.
  """

  weapons = ["R", "P", "S"]
  user_input = input("Hello! What's your name? ")
  print(f"Welcome to Pao Ying Chub Game krub Khun {user_input}")

  print("Please choose your weapon to play the game.")
  print("R >> Rock, P >> Paper, S >> Scissors")
  user_weapon = input()

  # Validate the user's weapon choice.
  while user_weapon.upper() not in weapons:
    print("You choose wrong weapon, please try again.")
    print("R >> Rock, P >> Paper, S >> Scissors")
    user_weapon = input()

  scores = 0
  gameplays = 0
  while user_weapon.lower() != "quit":
    bot_weapon = random.choice(weapons)

    # Print the user's and bot's weapon choices.
    print(f"Your weapon is {user_weapon}")
    print(f"Bot weapon is {bot_weapon}")

    # Determine the winner of the round.
    if user_weapon == bot_weapon:
      print("Draw !!")
    elif user_weapon == "R" and bot_weapon == "S":
      print("You win !!")
      scores += 1
    elif user_weapon == "P" and bot_weapon == "R":
      print("You win !!")
      scores += 1
    elif user_weapon == "S" and bot_weapon == "P":
      print("You win !!")
      scores += 1
    else:
      print("You loss !!")

    # Ask the user to play again or quit.
    print("To play next game, choose your weapon or type quit to end the game.")
    print("R >> Rock, P >> Paper, S >> Scissors")
    user_weapon = input()

    # Validate the user's weapon choice.
    while user_weapon.upper() not in weapons + ["QUIT"]:
      print("You choose wrong weapon, please try again or quit.")
      print("R >> Rock, P >> Paper, S >> Scissors")
      user_weapon = input()

    gameplays += 1

  # Thank the user for playing and print their final score.
  print("Thank you for playing Pao Ying Chub Game.")
  if gameplays == 1:
    print(f"You play only one game and your score is {scores}.")
  else:
    print(f"You play {gameplays} games and your scores are {scores}.")

if __name__ == "__main__":
  pao_ying_chub()
