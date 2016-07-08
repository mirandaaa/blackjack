$LOAD_PATH << '.'
require 'deck'
require 'dealer'
require 'player'

def check_win(player, dealer)
  if dealer.total == player.total
    puts "TIE GAME!"
  elsif (21-dealer.total) < (21-player.total)
    puts "DEALER WINS! Dealer total was #{dealer.total}, Player total was #{player.total}"
  else
    puts "PLAYER WINS! Player total was #{player.total}, Dealer total was #{dealer.total}"
  end
end

def end_game
  puts "Thanks for playing!"
  exit!
end

def play_hand
end

def check_bust(player, name)
  if player.total > 21
    puts "#{name} BUST!!!"
    if name == "Dealer"
      puts "Player wins!"
    else
      puts "Dealer wins!"
    end
    end_game
  end
end

puts "Welcome to Blackjack!"
deck = Deck.new

p1 = Player.new
p1.hand = [deck.game_deck[0], deck.game_deck[1]]
p1.total = p1.calculate_total

dealer = Dealer.new
dealer.hand = [deck.game_deck[2], deck.game_deck[3]]
dealer.total = dealer.calculate_total

puts "Cards in your hand: "
puts p1.hand.each{ |card| card.to_s }
puts "Your total is: #{p1.total}"

puts "The dealer has: \nX"
puts dealer.hand.drop(1).each{ |card| card.to_s }

user_response = ""
i = 3

#Continue asking until they stand
while user_response.casecmp("stand") == -1
  puts "Hit or stand?"
  user_response = gets.chomp

  if user_response.casecmp("hit") == 0
    puts "You hit!"
    p1.hand << deck.game_deck[i]
    p1.total = p1.calculate_total
    i += 1
  elsif user_response.casecmp("stand") == 0
    puts "You stand!"
  else
    puts "You did not type hit or stand! Please enter if you would like to hit or stand."
    redo
  end

  puts "Cards in your hand: "
  puts p1.hand.each{ |card| card.to_s }
  puts "Your total is: #{p1.total}"
  check_bust(p1, "Player")
end

#After player stands, dealer turn!
puts "The dealer has: "
puts dealer.hand.each{ |card| card.to_s }

while dealer.move?
  puts "Dealer hits!"
  dealer.hand << deck.game_deck[i+2]
  dealer.total = dealer.calculate_total
  i += 1

  puts "The dealer has: "
  puts dealer.hand.each{ |card| card.to_s }

  check_bust(dealer, "Dealer")
end

puts "Dealer stands!"

check_win(p1, dealer)
end_game

#
# #Counting cards, 4 have already been dealt in the beginning of the game (2 to user, 2 to dealer)
# i = 3
#
# while user_response.casecmp("stand") == -1
#   puts "Hit or stand?"
#   user_response = gets.chomp
#
#   if user_response.casecmp("hit") == 0
#     puts "You hit!"
#     p1.hand << deck.game_deck[i]
#     p1.total = p1.calculate_total
#   elsif user_response.casecmp("stand") == 0
#     puts "You stand!"
#   else
#     puts "You did not type hit or stand! Please enter if you would like to hit or stand."
#     redo
#   end
#
#   puts "Cards in your hand: "
#   puts p1.hand.each{ |card| card.to_s }
#   p1.total = p1.calculate_total
#   puts "Your total is: #{p1.total}"
#
#   if p1.total > 21
#     puts "YOU BUST!!!"
#     end_game
#   end
#
#   if dealer.move?
#     puts "DEALER HITS"
#     dealer.hand << deck.game_deck[i+2]
#   else
#     puts "DEALER STANDS"
#   end
#
#   puts "The dealer has: \nX"
#   puts dealer.hand.drop(1).each{ |card| card.to_s }
#   dealer.total = dealer.calculate_total
#   if dealer.total > 21
#     puts "DEALER BUSTS!!!"
#     puts "Player wins."
#     end_game
#   end
#
#   i += 1
# end
