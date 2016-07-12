# Class for a blackjack player to keep track of cards in hand and total value
class Player
  attr_reader :hand, :total
  attr_accessor :hand, :total

  def initialize
    @hand = []
    @total = calculate_total
  end

  def get_card_val(sum, card)
    # Face cards count as 10
    if %w(J K Q).include?(card.val)
      10
    # Ace should count as 1 or 11
    elsif card.val == 'A' && sum + 11 >= 21
      1
    elsif card.val == 'A' && sum + 11 < 21
      11
    else
      card.val.to_i
    end
  end

  def calculate_total
    hand.inject(0) do |sum, card|
      sum + get_card_val(sum, card)
    end
  end
end
