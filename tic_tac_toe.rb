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

      @display.render_board(@board.show_board)
      player_selection = gets.chomp.to_i
      @board.mark_square(player_selection, @current_player.letter)

      @display.render_board(@board.show_board)
      binding.pry


    end
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
      @board_slots = (1..9).to_a
    end

    def show_board
      @board_slots
    end

    def mark_square(slot, letter)
      # Need logic here prevent user from overriding opponent's square
      if @board_slots[slot - 1].is_a? Numeric
        @board_slots[slot - 1] = letter
      else
        puts 'That spot is taken'
      end
    end
  end

  # You probably don't need this to be a class.
  # If you want it in a separate file, look into that
  # It's simple: Takes an array, spits out the visual.
  class Display
    # This is to show the board on terminal
    # Takes array from Board and renders it appropriately
    # OR
    # It can just take a slot/letter at a time and update itself...
    def initialize
    end

    def render_board(board_slots)
      puts "
       #{board_slots[0]} | #{board_slots[1]} | #{board_slots[2]}
      -----------
       #{board_slots[3]} | #{board_slots[4]} | #{board_slots[5]}
      -----------
       #{board_slots[6]} | #{board_slots[7]} | #{board_slots[8]}
      "

    end
  end

  # Game.new
  Game.new.play_game
end
