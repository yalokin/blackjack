require_relative 'account'
require_relative 'deck'

class Member
  attr_reader :account, :name

  def initialize(name, game)
    @name = name
    @game = game
    @cards = []
    @account = Account.new(self, 0)
    raise 'Name can not be empty' if name.empty?
  end

  def take_card(card)
    @cards << card
  end

  def reset_cards
    @cards.clear
  end

  def count_cards
    @cards.size
  end

  def show_cards
    print "Cards:"
    @cards.each { |card| print " [ #{card[0]} ]" }
    print "\n"
  end

  def show_scores
    puts "Scores: #{count_scores}"
  end

  def show_money
    puts "You have $#{@account.sum}"
  end

  def count_scores
    scores = 0
    ace = false
    @cards.each do |card|
      scores += card[1]
      ace = true if card[1] == 1
    end
    if scores + 10 < 22
      scores + 10
    else
      scores
    end
  end

end
