require_relative 'player'
require_relative 'deck'

class Application

  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    create_players(player_name)
    give_cards
  end

  def player_name
    print "Enter your name: "
    name = gets.strip
  end

  def create_players(player_name)
    @player = Player.new(player_name)
    @dealer = Player.new('Dialer')
  end

  def give_cards
    2.times do
      @player.take_card(@deck.give_card)
      @dealer.take_card(@deck.give_card)
    end
  end
  
end

app = Application.new

p app