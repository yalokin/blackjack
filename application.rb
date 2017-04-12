require_relative 'player'
require_relative 'deck'

class Application

  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    create_players(player_name)
    give_cards
    @bank = Account.new(:bank, 0)
  end

  def player_name
    print "Enter your name: "
    name = gets.strip
  end

  def create_players(player_name)
    @player = Player.new(player_name)
    @dealer = Player.new('Dealer')
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

  end

  def game
    place_bet(10)
    # проверка на 3 карты
    unless @player.count_cards = 3 || @dealer.count_cards = 3
    #   ход игрока
    #     подсчет очков
    #     пропустить
    #     взать карту
    #     открыть
    #   ход дилера
    #     пропустить
    #     взять карту
    # подсчет очков
    # результат
    # перевод банка
    # играть?
    end
  end
  
end

app = Application.new
app.place_bet(10)

p app