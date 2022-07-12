# Tic Tac Toe Planning:

## Initial Thoughts:

- Can we use a Module? Does a module group classes?

## Components:

### The board:

1. Has 9 spots
1. Each slot is a hash that has:

   - Each slot has an index/number
   - Each slot has a 'player' property which is empty

1. The 'board' holds the 'state' of the game
1. The board can also hold the state of the game in an array, length of 9. Each index can be:
    - An empty string
    - An 'x', 'o'

### Player:

1. Name
1. Designation of 'x' or 'o'

### Game:

1. Sets the two players' names, and if they're 'x' or 'o'
1. Keeps track of whether game is complete:
   - winner?
   - tie?
1. Controls which turn it is

Essentially, the game is a 'loop' that keeps alternating between the players until conditions are met:
1. There is a winner
1. There is a tie

You'll need various methods and logic to keep this going

**This is the sequence**:
1. Player makes a choice
    - Choice must be validated
    - Choice could be invalid:
        - Another player/same player has already placed letter in that square
        - User input could be something that isn't 1-9
    - How do you handle those errors and feed back to the step in the game?
2. When player makes a (valid) choice, the board is rendered
3. The _Game_ checks
    - Is there is a winner?
        - Some function/method must check the `@board_slots`
    - If there isn't a winner, can the game continue?
        - Are there any available slots left to play on the board?
    - If the game can't continue, start a new game or quit!
        - How do we perform these options?
