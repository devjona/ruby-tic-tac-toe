require 'pry'

module TicTacToe
  WINNING_COMBOS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]

  class Game
    def initialize
      game_start_greeting
      set_player_names
      @board = Board.new
      @display = Display.new
    end

    def game_start_greeting
      puts "Hello! Let's play TicTacToe!"
    end

    def player_name_question(position)
      puts "What's the #{position} player's name?"
    end

    def set_player_names
      # puts "What's the first player's name?"
      player_name_question('first')
      @player1 = Player.new(gets.chomp, 'x')
      puts "Player 1 is #{@player1.name}"

      player_name_question('second')
      @player2 = Player.new(gets.chomp, 'o')
      puts "Player 2 is #{@player2.name}"

      @current_player = @player1
    end

    def play_game
      puts "Let's play!!! It's #{@current_player.name}'s turn!"
      puts "#{@current_player.name}, pick a place to put your #{@current_player.letter}"

      @display.render_board
      @board.mark_square(gets.chomp.to_i, @current_player.letter)
      binding.pry
    end

    # self.play_game
  end

  class Player
    attr_reader(:name, :letter)

    def initialize(name, letter)
      @name = name
      @letter = letter
    end
  end

  class Board
    def initialize
      @board_slots = Array.new(9) { '' }
    end

    def show_board
      @board_slots
    end

    def mark_square(slot, letter)
      @board_slots[slot - 1] = letter
    end
  end

  class Display
    # This is to show the board on terminal
    def initialize

    end

    def render_board
      puts "
       1 | 2 | 3
      -----------
       4 | 5 | 6
      -----------
       7 | 8 | 9
      "
    end


  end

  # Game.new
  Game.new.play_game
end
