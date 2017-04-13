require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'interface'
require_relative 'game'

class Application

  attr_reader :player, :dealer, :deck, :game

  def initialize
    @menu = Interface.new
    @game = Game.new
    @game.create_players(@menu.player_name)
    @game.give_cards
  end
end

app = Application.new
app.game.game