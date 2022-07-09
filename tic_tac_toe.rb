require 'pry'

module TicTacToe
  class Game
    def initialize
      game_start_greeting
      set_player_names
    end

    def game_start_greeting
      puts "Hello! let's play TicTacToe!"
    end

    def player_name_question(position)
      puts "What's the #{position} player's name?"
    end

    def set_player_names
      # puts "What's the first player's name?"
      player_name_question('first')
      player1 = Player.new(gets.chomp, 'x')
      puts "Player 1 is #{player1.show_name}"

      player_name_question('second')
      player2 = Player.new(gets.chomp, 'o')
      puts "Player 2 is #{player2.show_name}"
    end
  end

  class Player
    # attr_accessor(:name, :x_or_o)
    def initialize(name, letter)
      @name = name
      @letter = letter
    end

    def show_name
      @name
    end

    def show_letter
      @letter
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

  Game.new
end
