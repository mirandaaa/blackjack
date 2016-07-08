$LOAD_PATH << '.'
require 'player'

class Dealer < Player
  def move?
    if self.total < 17
      true
    else
      false
    end
  end

end
