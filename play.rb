$LOAD_PATH << '.'
require 'deck'
require 'dealer'
require 'player'

def check_win(dealer, player)
  if dealer.total == player.total
    puts "TIE GAME"
  end

  if (21-dealer.total) < (21-player.total)
    puts "DEALER WINS! Dealer total was #{dealer.total}, Player total was #{player.total}"
  else
    puts "PLAYER WINS! Player total was #{player.total}, Dealer total was #{dealer.total}"
  end
end

def end_game
  puts "Thanks for playing!"
  exit!
end

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

puts "The dealer has: \nX"
puts dealer.hand.drop(1).each{ |card| card.to_s }

user_response = ""

#Counting cards, 4 have already been dealt in the beginning of the game (2 to user, 2 to dealer)
i = 3

while user_response.casecmp("stand") == -1 || dealer.move?
  puts "Hit or stand?"
  user_response = gets.chomp

  if user_response.casecmp("hit") == 0
    puts "You hit!"
    p1.hand << deck.game_deck[i]
    p1.total = p1.calculate_total
  elsif user_response.casecmp("stand") == 0
    puts "You stand!"
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
    puts "Dealer wins."
    end_game
  end

  if dealer.move?
    puts "DEALER HITS"
    dealer.hand << deck.game_deck[i+2]
  else
    puts "DEALER STANDS"
  end

  puts "The dealer has: \nX"
  puts dealer.hand.drop(1).each{ |card| card.to_s }
  dealer.total = dealer.calculate_total
  if dealer.total > 21
    puts "DEALER BUSTS!!!"
    puts "Player wins."
    end_game
  end

  i += 1
end

check_win(dealer, p1)
end_game
