require_relative 'player'
require_relative 'dealer'
require_relative 'deck'

class Game

  def initialize
    @deck = Deck.new
    @bank = Account.new(:bank, 0)
  end

  def create_players(player_name)
    @player = Player.new(player_name)
    @dealer = Dealer.new('Dealer')
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
  end 

  def player_choice
    choice = @player.action_choice
    case choice
    when 1
      puts 'skip'
    when 2
      @player.take_card
    when 3
      puts 'open_cards'
    else puts "Make the right choice!"
    end
  end

  def game
    #place_bet(10)
    # проверка на 3 карты
 #   unless @player.count_cards == 3 || @dealer.count_cards == 3
    #   ход игрока
      player_action
      player_choice
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
   # end
    #открыть карты
  end   

end
