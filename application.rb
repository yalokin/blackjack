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
    @player.print_cards
    @player.print_scores
  end

  def player_choice
    puts 'What is your action? '
    puts '|| 1 - Skip || 2 - Take a card || 3 - Open a cards ||'
    choice = gets.chomp.to_i

    case choice
    when 1
      skip
    when 2
      @player.take_card
    when 3
      open_cards
    else puts "Make the right choice!"
    end
  end

  def game
    place_bet(10)
    # проверка на 3 карты
    unless @player.count_cards == 3 || @dealer.count_cards == 3
    #   ход игрока
      player_action
    #     подсчет очков
    #     показать карты и очки игрока
    #     показать количество карт дилера
    #     дать выбор игроку
    #       пропустить
    #       взять карту
    #       открыть карты
    #   ход дилера
    #     пропустить
    #     взять карту
    # подсчет очков
    # результат
    # перевод банка
    # играть?
    end
    #открыть карты
  end
  
end

app = Application.new

#p app
app.game