$LOAD_PATH << '.'
require 'player'

# Class for dealer, a type of player, with extra rules - must hit until 17
class Dealer < Player
  def move?
    if total <= 17
      true
    else
      false
    end
  end
end
