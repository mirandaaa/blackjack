require_relative 'deck'
require_relative 'dealer'
require_relative 'player'

def check_bust(player, dealer)
  if player.total > 21
    puts 'PLAYER BUST!! Dealer wins! '\
    "Player total: #{player.total}, Dealer total: #{dealer.total}"
    end_game
  end
  if dealer.total > 21
    puts 'DEALER BUST!! Player wins! '\
    "Player total: #{player.total}, Dealer total: #{dealer.total}"
    end_game
  end
end

def check_win(player, dealer)
  d = 21 - dealer.total # How close dealer total is to 21
  pl = 21 - player.total # How close player total is to 21
  puts 'TIE GAME!' if d == pl
  puts 'DEALER WINS! '\
  "Player total: #{player.total}, Dealer total: #{dealer.total}" if d < pl
  puts 'PLAYER WINS! '\
  "Player total: #{player.total}, Dealer total: #{dealer.total}" if d > pl
end

def end_game
  puts 'Thanks for playing! Seeya next time'
  exit!
end

# Game starts here...
puts 'Welcome to Blackjack!'
deck = Deck.new

p1 = Player.new
p1.hand = [deck.draw, deck.draw]
p1.total

dealer = Dealer.new
dealer.hand = [deck.draw, deck.draw]
dealer.total

puts 'Cards in your hand: '
puts p1.hand.each(&:to_s)
puts "Your total is: #{p1.total}"

puts "The dealer has: \nX"
puts dealer.hand.drop(1).each(&:to_s)

user_response = ''

# Keeping track of cards in the deck, 4 have already been dealt
card_num = 4

# Continue asking until player stands
until user_response.casecmp('stand') == 0
  puts 'Hit or stand?'
  user_response = gets.chomp

  if user_response.casecmp('hit') == 0
    puts 'You hit!'
    p1.hand << deck.draw
    card_num += 1
    puts 'Cards in your hand: '
    puts p1.hand.each(&:to_s)
    puts "Your total is: #{p1.total}"
    check_bust(p1, dealer)
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
  dealer.hand << deck.draw
  card_num += 1

  puts 'The dealer has: '
  puts dealer.hand.each(&:to_s)
  check_bust(p1, dealer)
end

puts 'Dealer stands!'
check_win(p1, dealer)
end_game
