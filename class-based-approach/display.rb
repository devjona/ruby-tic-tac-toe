# You probably don't need this to be a class.
# If you want it in a separate file, look into that
# It's simple: Takes an array, spits out the visual.
class Display
  # This is to show the board on terminal
  # Takes array from Board and renders it appropriately
  # OR
  # It can just take a slot/letter at a time and update itself...
  def initialize; end

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
