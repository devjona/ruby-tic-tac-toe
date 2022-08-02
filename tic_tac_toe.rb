require 'pry'
require_relative 'board'
require_relative 'display'
require_relative 'player'

module TicTacToe
  # These are 0-indexed 3x3 grid:
  # 0 1 2
  # 3 4 5
  # 6 7 8
  WINNING_COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  class Game
    def initialize
      game_start_greeting
      set_player_names
      @board = Board.new
      @display = Display.new
      @tie = nil
      @winner = nil
      @no_winner_or_tie = true
    end

    def game_start_greeting
      puts "Hello! Let's play TicTacToe!"
    end

    def player_name_question(position)
      puts "What's the #{position} player's name?"
    end

    def set_player_names
      player_name_question('first')
      @player1 = Player.new(gets.chomp, 'X')
      puts "Player 1 is #{@player1.name}"

      player_name_question('second')
      @player2 = Player.new(gets.chomp, 'O')
      puts "Player 2 is #{@player2.name}"

      @current_player = @player1
    end

    def check_for_win_or_tie
      puts 'Checking for winning combo...'

      # Always check for winning combos first
      WINNING_COMBOS.each do |combo|
        next unless combo.all? { |num| @current_player.selections.include?(num) }

        @winner = @current_player
        @no_winner_or_tie = false
        break
      end

      # If we don't have a winner and no numers are left, it's a tie.
      if @board.board_slots.any? { |slot| slot.is_a? Numeric }
        nil
      else
        @tie = true
        @no_winner_or_tie = false
      end

      if !@winner.nil?
        nil
      elsif !@tie.nil?
        nil
      else
        @current_player = @current_player == @player1 ? @player2 : @player1
      end
    end

    def get_and_validate_player_selection
      puts "#{@current_player.name}, pick a place to put your #{@current_player.letter}: "
      @display.render_board(@board.show_board)

      # Validate that the player selected a slot... 1-9. It can't be any other character.
      player_selection = gets.chomp.to_i - 1

      if @board.board_slots[player_selection].is_a? Numeric
        @board.mark_square(player_selection, @current_player.letter)
        @current_player.selections.push(player_selection)
      else
        puts 'That spot is taken; choose another available square.'
        get_and_validate_player_selection
      end
    end

    def play_game
      puts "Let's play!!!\n\nIt's #{@current_player.name}'s turn!"
      while @no_winner_or_tie

        get_and_validate_player_selection
        check_for_win_or_tie
      end

      if @winner
        puts "#{@current_player.name} is the WINNER! Look at the winning board! \n"
        @display.render_board(@board.show_board)
      end

      puts "We have a tie; let's figure out how to start a fresh game or quit." if @tie
    end
  end

  # Game.new
  Game.new.play_game
end
