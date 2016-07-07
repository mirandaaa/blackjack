class Player
  attr_reader :hand, :total
  attr_accessor :hand, :total

  def initialize()
    @hand = []
    @total = 0
  end

  def calculate_total
    hand.inject(0){ |sum, card|
      value = 0
      if card.val == "J" || card.val == "Q" || card.val == "K"
        value = 10
      elsif card.val == "A" && (@total+11 < 21)
        value = 11
      elsif card.val == "A" && (@total+11 > 21)
        value = 1
      else
        value = card.val.to_i
      end

      sum+value
    }
  end
end
