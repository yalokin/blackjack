require_relative 'member'

class Player < Member

  def show_cards
    print "Your cards:"
    @cards.each { |card| print " [ #{card[0]} ]" }
    print "\n"
  end

  def show_scores
    puts "Your scores: #{count_scores}"
  end

  def action_choice
    puts 'What is your action? '
    puts '|| 1 - Skip || 2 - Take a card || 3 - Open a cards ||'
    choice = gets.chomp.to_i
    #Todo добавить проверку ввода
  end

  def show_money
    puts "You have $#{@account.sum}"
  end
end
