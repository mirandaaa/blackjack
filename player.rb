# Class for a blackjack player to keep track of cards in hand and total value
class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def total
    # Always calculate Aces last
    sort_hand
    hand.inject(0) do |sum, card|
      sum + card.get_card_val(sum)
    end
  end

  def busted?
    total > 21
  end

  # Method to move all Aces to end
  def sort_hand
    aces = []
    hand.map do |card|
      if card.val == 'A'
        aces << card
        hand.delete(card)
      end
    end
    (hand << aces).flatten!
  end
end
