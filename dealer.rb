$LOAD_PATH << '.'
require 'player'

class Dealer < Player

  def move?
    if total < 17
      true
    else
      false
    end
  end

end
