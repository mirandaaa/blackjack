class Card
  attr_reader :val, :suit
  attr_accessor :val, :suit

  def initialize(val, suit)
    @val = val
    @suit = suit
  end

  def to_s
    "#{val} #{suit}"
  end
end
