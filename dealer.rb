$LOAD_PATH << '.'
require 'player'

class Dealer < Player
  #Dealer has extra rules - must hit until 17
  def move?
    if self.total <= 17
      true
    else
      false
    end
  end

end
