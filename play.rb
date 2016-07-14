require_relative 'deck'
require_relative 'dealer'
require_relative 'player'

def check_bust(player)
  player.busted?
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

def play_player_hand(p1, deck)
  user_response = ''
  # Continue asking until player stands
  until user_response.casecmp('stand') == 0
    puts 'Hit or stand?'
    user_response = gets.chomp

    if user_response.casecmp('hit') == 0
      puts 'You hit!'
      p1.hit!(deck.draw!)
      puts 'Cards in your hand: '
      puts p1.hand.each(&:to_s)
      puts "Your total is: #{p1.total}"
      if check_bust(p1)
        puts 'PLAYER BUST!!! Dealer wins!'
        end_game
      end
    elsif user_response.casecmp('stand') == 0
      puts 'You stand!'
    else
      puts 'You did not type hit or stand!'\
      'Please enter if you would like to hit or stand.'
      redo
    end
  end
end

def play_dealer_hand(dealer, deck)
  # After player stands, dealer turn!
  # Reveal the "X" card
  puts 'The dealer reveals hand: '
  puts dealer.hand.each(&:to_s)

  while dealer.move?
    puts 'Dealer hits!'
    dealer.hit!(deck.draw!)
    puts 'The dealer has: '
    puts dealer.hand.each(&:to_s)
    if check_bust(dealer)
      puts 'DEALER BUST!!! Player wins!'
      end_game
    end
  end
  puts 'Dealer stands!'
end

def play_game(player, dealer, deck)
  # Game starts here...
  puts 'Welcome to Blackjack!'
  puts 'Cards in your hand: '
  puts player.hand.each(&:to_s)
  puts "Your total is: #{player.total}"
  puts "The dealer has: \nX"
  puts dealer.hand.drop(1).each(&:to_s)
  play_player_hand(player, deck)
  play_dealer_hand(dealer, deck)
  check_win(player, dealer)
end

if __FILE__ == $0
  deck = Deck.new
  p1 = Player.new
  p1.hand = [deck.draw!, deck.draw!]
  dealer = Dealer.new
  dealer.hand = [deck.draw!, deck.draw!]
  play_game(p1, dealer, deck)
  end_game
end
