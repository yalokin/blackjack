require_relative 'member'

class Player < Member

  def action_choice
    puts 'What is your action? '
    puts '|| 1 - Skip || 2 - Take a card || 3 - Open a cards ||'
    choice = gets.chomp.to_i
    #Todo добавить проверку ввода
  end

end
