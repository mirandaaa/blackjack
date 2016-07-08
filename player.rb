class Player
  attr_reader :hand, :total
  attr_accessor :hand, :total

  def initialize()
    @hand = []
    @total = calculate_total
  end

  def calculate_total
    if self.hand.empty?
      self.total = 0
    else
      self.hand.inject(0){ |sum, card|
        value = 0
        #Face cards count as 10
        if card.val == "J" || card.val == "Q" || card.val == "K"
          value = 10
          #Ace should count as 1 or 11
        elsif card.val == "A"
          if sum+11 >= 21
            value = 1
          else
            value = 11
          end
        else
          value = card.val.to_i
        end
        sum+value
      }
    end
  end

end
