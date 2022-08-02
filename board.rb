class Board
  attr_reader(:board_slots)

  def initialize
    @board_slots = (1..9).to_a
  end

  def show_board
    @board_slots
  end

  def mark_square(slot, letter)
    @board_slots[slot] = letter
  end
end
