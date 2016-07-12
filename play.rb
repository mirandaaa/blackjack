$LOAD_PATH << '.'
require 'deck'
require 'dealer'
require 'player'

def check_bust(player, name)
  if player.total > 21
    puts "#{name} BUST!!!"
    if name == 'Dealer'
      puts 'Player wins!'
    else
      puts 'Dealer wins!'
    end
    end_game
  end
end

def check_win(player, dealer)
  if dealer.total == player.total
    puts 'TIE GAME!'
  elsif (21 - dealer.total) < (21 - player.total)
    puts 'DEALER WINS! '\
    "Dealer total was #{dealer.total}, Player total was #{player.total}"
  else
    puts 'PLAYER WINS! '\
    "Player total was #{player.total}, Dealer total was #{dealer.total}"
  end
end

def end_game
  puts 'Thanks for playing! Seeya next time'
  exit!
end

# Game starts here...
puts 'Welcome to Blackjack!'
deck = Deck.new

p1 = Player.new
p1.hand = [deck.game_deck[0], deck.game_deck[1]]
p1.total = p1.calculate_total

dealer = Dealer.new
dealer.hand = [deck.game_deck[2], deck.game_deck[3]]
dealer.total = dealer.calculate_total

puts 'Cards in your hand: '
puts p1.hand.each(&:to_s)
puts "Your total is: #{p1.total}"

puts "The dealer has: \nX"
puts dealer.hand.drop(1).each(&:to_s)

user_response = ''

# Keeping track of cards in the deck, 4 have already been dealt
card_num = 3

# Continue asking until player stands
until user_response.casecmp('stand') == 0
  puts 'Hit or stand?'
  user_response = gets.chomp

  if user_response.casecmp('hit') == 0
    puts 'You hit!'
    p1.hand << deck.game_deck[card_num]
    card_num += 1
    p1.total = p1.calculate_total
    puts 'Cards in your hand: '
    puts p1.hand.each(&:to_s)
    puts "Your total is: #{p1.total}"
    check_bust(p1, 'Player')
  elsif user_response.casecmp('stand') == 0
    puts 'You stand!'
  else
    puts 'You did not type hit or stand!'\
    'Please enter if you would like to hit or stand.'
    redo
  end
end

# After player stands, dealer turn!
# Reveal the "X" card
puts 'The dealer reveals hand: '
puts dealer.hand.each(&:to_s)

while dealer.move?
  puts 'Dealer hits!'
  dealer.hand << deck.game_deck[card_num]
  card_num += 1

  puts 'The dealer has: '
  puts dealer.hand.each(&:to_s)

  dealer.total = dealer.calculate_total
  check_bust(dealer, 'Dealer')
end

puts 'Dealer stands!'
check_win(p1, dealer)
end_game
