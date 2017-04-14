require_relative 'player'
require_relative 'dealer'
require_relative 'deck'

class Game
  attr_reader :deck

  def initialize
    @deck = Deck.new
    @bank = Account.new(:bank, 0)
  end

  def create_players(player_name)
    @player = Player.new(player_name, self)
    @dealer = Dealer.new('Dealer', self)
  end

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
    @dealer.show_cards
    player_choice
  end

  def player_choice
    choice = @player.action_choice
    case choice
    when 1
      dealer_action
    when 2
      @player.take_card(@deck.give_card)
    when 3
      puts 'open_cards' #результат и приглашение поиграть снова
    else
      puts "Make the right choice!"
      player_choice
    end
  end

  def dealer_action
    @dealer.action
  end

  def party
    place_bet(10)
    # проверка на 3 карты
    unless (@player.count_cards && @dealer.count_cards) == 3
      player_action
      dealer_action
    # подсчет очков
    # результат
    # перевод банка
    # играть?
    end
    # открыть карты
  end

  def start
    puts "Hello #{@player.name}! Now we will play blackjack"

    @player.account.init_sum(100)
    @dealer.account.init_sum(100)

    party
  end
end
