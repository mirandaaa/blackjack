require_relative 'player'

# Class for dealer, a type of player with extra rules - must hit until 17
class Dealer < Player
  def move?
    total <= 17
  end
end
