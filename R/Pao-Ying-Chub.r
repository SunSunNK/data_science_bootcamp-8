pao_ying_chub <- function() {
  weapons <- c("R","P","S")
  print("Hello! What's your name ?")
  userinput <- readLines("stdin",n=1)
  print(paste("Welcome to Pao Ying Chub Game krub Khun",userinput))
  
  print("Please choose your weapon to play the game.")
  print("R >> Rock, P >> Paper, S >> Scissors")
  userweapon <- readLines("stdin",n=1)
  while (!toupper(userweapon) %in% weapons) {
    print("You choose wrong weapon, please try again.")
    print("R >> Rock, P >> Paper, S >> Scissors")
    userweapon <- readLines("stdin",n=1)
  }
  scores <- 0
  gameplays <- 0
  while (tolower(userweapon) != 'quit') {
    botweapon <- sample(weapons,1)
    print(paste("Your weapon is",userweapon))
    print(paste("Bot weapon is",botweapon))
    if (userweapon == botweapon) {
      print("Draw !!")
    } else if (userweapon == "R" & botweapon == "S") {
      print("You win !!")
      scores <- scores+1
    } else if (userweapon == "P" & botweapon == "R") {
      print("You win !!")
      scores <- scores+1
    } else if (userweapon == "S" & botweapon == "P") {
      print("You win !!")
      scores <- scores+1
    } else {
      print("You loss !!")
    }
    print("To play next game, choose your weapon or type quit to end the game.")
    print("R >> Rock, P >> Paper, S >> Scissors")
    userweapon <- readLines("stdin",n=1)
    while (!toupper(userweapon) %in% append(weapons,"QUIT")) {
    print("You choose wrong weapon, please try again or quit.")
    print("R >> Rock, P >> Paper, S >> Scissors")
    userweapon <- readLines("stdin",n=1)
    }
    gameplays <- gameplays+1
  }
  print("Thank you for playing Pao Ying Chub Game.")
  if (gameplays == 1) {
    print(paste0("You play only one game and your score is ", scores, "."))
  } else {
    print(paste0("You play ", gameplays, " games and your scores are ", 
                 scores, "."))
  }
}

pao_ying_chub()