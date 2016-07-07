$LOAD_PATH << '.'
require 'deck'
require 'dealer'
require 'player'

deck = Deck.new

puts "Welcome to Blackjack!"
p1 = Player.new
p1.hand = [deck.game_deck[0], deck.game_deck[1]]
p1.total = p1.calculate_total

dealer = Dealer.new
dealer.hand = [deck.game_deck[2], deck.game_deck[3]]
dealer.total = dealer.calculate_total

puts "Cards in your hand: "
puts p1.hand.each{ |card| card.to_s }
puts "Your total is: #{p1.total}"

puts "The dealer has: "
puts dealer.hand.drop(1).each{ |card| card.to_s }

user_response = ""

#Counting cards
i = 3

while user_response.casecmp("stand") == -1
  puts "Hit or stand?"
  user_response = gets.chomp
  if user_response.casecmp("hit") == 0
    puts "You hit!"
    p1.hand << deck.game_deck[i]
    p1.total = p1.calculate_total

    #Check bust
    #Dealer move
  elsif user_response.casecmp("stand") == 0
    puts "You stand!"
    #Dealer move
  else
    puts "You did not type hit or stand! Please enter if you would like to hit or stand."
    redo
  end

  puts "Cards in your hand: "
  puts p1.hand.each{ |card| card.to_s }
  p1.total = p1.calculate_total
  puts "Your total is: #{p1.total}"

  if p1.total > 21
    puts "YOU BUST!!!"
    break
  end

  puts "The dealer has: "
  dealer.hand << deck.game_deck[i+2]
  puts dealer.hand.drop(1).each{ |card| card.to_s }

  i += 1
end
