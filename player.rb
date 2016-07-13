# Class for a blackjack player to keep track of cards in hand and total value
class Player
  attr_reader :hand, :total
  attr_accessor :hand, :total

  def initialize
    @hand = []
    @total = calculate_total
  end

  def calculate_total
    hand.inject(0) do |sum, card|
      sum + card.get_card_val(sum)
    end
  end
end
