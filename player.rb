require_relative 'account'
require_relative 'deck'

class Player
  attr_reader :account

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
    scores = 0
    ace = false
    @cards.each do |card|
      scores += card[1]
      ace = true if card[1] == 11
    end
    #todo добавить расчет при  наличии туза
    scores
  end

  def count_cards
    @cards.size
  end

  def print_cards
    print "Your cards:"
    @cards.each { |card| print " #{card[0]}" }
    print "\n"
  end

  def print_scores
    puts "Your scores: #{count_scores}"
  end
end
