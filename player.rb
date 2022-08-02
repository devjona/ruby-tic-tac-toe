# Player class, keeps track of player's selections
class Player
  attr_reader(:name, :letter)
  attr_accessor(:selections)

  def initialize(name, letter)
    @name = name
    @letter = letter
    @selections = []
  end
end
