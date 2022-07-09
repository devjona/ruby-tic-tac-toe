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

### Player:

1. Name
1. Designation of 'x' or 'o'

### Game:

1. Sets the two players' names, and if they're 'x' or 'o'
1. Keeps track of whether game is complete:
   - winner?
   - tie?
1. Controls which turn it is
