Let's do this but try with a functional approach, only methods, only modules, no classes.

Are functional programming and using classes compatible?

If we only use functions, what will hold the 'state' of the game?
- How do we keep those variables from being global? How do we encapsulate them?

Can we do this:
- Top-level module
  - Holds variables (state)
  - Glues all the building blocks together
    - display
    - board
    - player
    - game

I don't know if the actual modules ever need to be reused... I mean, this is a very specific game.
