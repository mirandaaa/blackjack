$LOAD_PATH << '.'
require 'card'

class Deck
  attr_reader :game_deck

  def initialize()
    #Set up deck
    hearts = "\u2665".encode('utf-8')
    spades = "\u2660".encode('utf-8')
    clubs = "\u2663".encode('utf-8')
    diamonds = "\u2666".encode('utf-8')
    suits = [hearts, spades, clubs, diamonds]
    nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

    @game_deck = []

    #Populate deck with 52 cards
    nums.each do |num|
      suits.each do |suit|
        card = Card.new(num, suit)
        @game_deck << card
      end
    end

    #Shuffle the deck
    @game_deck = @game_deck.shuffle
  end

end
