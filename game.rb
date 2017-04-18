require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'result'

class Game
  include Result

  attr_reader :deck

  def initialize
    @bank = Account.new(:bank, 0)
  end

  def start
    puts "Hello #{@player.name}! Now we will play blackjack"

    @player.account.sum = 100
    @dealer.account.sum = 100

    party
  end

  def create_players(player_name)
    @player = Player.new(player_name, self)
    @dealer = Dealer.new('Dealer', self)
  end

  private

  def give_cards
    2.times do
      @player.take_card(@deck.give_card)
      @dealer.take_card(@deck.give_card)
    end
  end

  def place_bet(sum)
    @player.account.transfer(@bank, sum)
    @dealer.account.transfer(@bank, sum)
  end

  def player_action
    @player.show_cards
    @player.show_scores
    @player.show_money
    @dealer.show_back_cards
    player_choice
  end

  def player_choice
    choice = @player.action_choice
    case choice
    when 1
      return
    when 2
      @player.take_card(@deck.give_card)
    when 3
      open_cards
    else
      puts "Make the right choice!"
      player_choice
    end
  end

  def open_cards
    puts "Player:"
    @player.show_cards
    @player.show_scores
    puts "Dealer:"
    @dealer.show_cards
    @dealer.show_scores
    result
    @end_party = true
    play_again
  end

  def play_again
    puts "Will we play again? Yes, or no?"
    choice = gets.strip.upcase
    if choice == 'YES'
      party
    elsif choice == 'NO'
      exit
    else
      puts 'Make the right choice!'
      play_again
    end
  end

  def new_party
    @end_party = false
    @deck = Deck.new
    @player.reset_cards
    @dealer.reset_cards
    give_cards
    place_bet(10)
  end

  def party
    new_party
    until @player.count_cards == 3 && @dealer.count_cards == 3
      player_action unless @end_party
      @dealer.action unless @end_party
    end

    open_cards unless @end_party
  end

end
