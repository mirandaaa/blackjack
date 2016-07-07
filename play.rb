$LOAD_PATH << '.'
require 'card'
# require 'dealer'
require 'player'

#Set up deck
game_deck = []

hearts = "\u2665".encode('utf-8')
spades = "\u2660".encode('utf-8')
clubs = "\u2663".encode('utf-8')
diamonds = "\u2666".encode('utf-8')
suits = [hearts, spades, clubs, diamonds]
nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]


#Populate deck with 52 cards
nums.each do |num|
  suits.each do |suit|
    card = Card.new(num, suit)
    game_deck << card
  end
end


game_deck = game_deck.shuffle

puts "Welcome to Blackjack!"

p1 = Player.new
p1.hand = [game_deck[0], game_deck[1]]
puts "Your hand is: #{p1.show_hand}"
puts "Your total is: #{p1.calculate_total}"
