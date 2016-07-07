# class Deck
#   hearts = "\u2665".encode('utf-8')
#   spades = "\u2660".encode('utf-8')
#   clubs = "\u2663".encode('utf-8')
#   diamonds = "\u2666".encode('utf-8')
#   suits = [hearts, spades, clubs, diamonds]
#   nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "J", "Q", "K"]
#
#   @@deck = []
#
#   #Populate deck with 52 cards
#   nums.each do |num|
#     suits.each do |suit|
#       card = "#{num}#{suit}"
#       @@deck << card
#     end
#   end
#
# #Shuffle the deck
#   def shuffle_cards
#     @@deck.shuffle
#   end
# end
#
# class Player
#   attr_reader :hand, :total
#   attr_accessor :hand, :total
#
#   def initialize(hand)
#     @hand = hand
#     @total = 0
#   end
#
#   def calculate_total
#     hand.inject{ |sum, card|
#
#       #Last character is the card's suit
#       card_val = card[0..-1]
#
#       #Check for Jack, King, Queen
#       val = 10
#
#       if card_val == "J" || card_val == "Q" || card_val == "K"
#         val = 10
#       elsif card_val == "A"
#         tot = total + 11
#         if tot > 21
#           val = 1
#         else
#           val = 11
#         end
#       else
#         val = card_val.to_i
#       end
#
#       sum.to_i + val }
#   end
# end
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
