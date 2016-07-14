require_relative 'card'

# Class structure for Deck, which is a collection of cards
class Deck
  attr_reader :deck

  def initialize
    # Set up deck
    hearts = "\u2665".encode('utf-8')
    spades = "\u2660".encode('utf-8')
    clubs = "\u2663".encode('utf-8')
    diamonds = "\u2666".encode('utf-8')
    suits = [hearts, spades, clubs, diamonds]
    nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    populate_deck(nums, suits)

    # Shuffle the deck
    @deck.shuffle!
  end

  def draw
    @deck.shift
  end

  private

  def populate_deck(nums, suits)
    # Populates deck with cards of each num and each suit
    @deck = nums.map { |num| suits.map { |suit| Card.new(num, suit) } }.flatten
  end
end
