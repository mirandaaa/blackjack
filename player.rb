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
      # Face cards count as 10
      if card.val == 'J' || card.val == 'Q' || card.val == 'K'
        sum + 10
      # Ace should count as 1 or 11
      elsif card.val == 'A' && sum + 11 >= 21
        sum + 1
      elsif card.val == 'A' && sum + 11 < 21
        sum + 11
      else
        sum + card.val.to_i
      end
    end
  end
end
