require_relative 'account'
require_relative 'deck'

class Player

  def initialize(name)
    @name = name
    @cards = []
    @account = Account.new(self, 100)
    raise 'Name can not be empty' if name.empty?
  end

  def take_card(card)
    @cards << card
  end

  def count_scores
    #туз 1 или 11
    sum = 0
    @cards.each do |card|
    end
  end

end
