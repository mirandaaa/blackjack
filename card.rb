# Class structure for card, it has a numeric value and a suit
class Card
  attr_accessor :val, :suit

  def initialize(val, suit)
    @val = val
    @suit = suit
  end

  def get_card_val(sum)
    # Face cards count as 10
    if %w(J K Q).include?(@val)
      10
    # Ace should count as 1 or 11
    elsif @val == 'A' && sum + 11 > 21
      1
    elsif @val == 'A' && sum + 11 < 21
      11
    else
      @val.to_i
    end
  end

  def to_s
    "#{val} #{suit}"
  end
end
