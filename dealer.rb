class Dealer < Player
  def print_cards
    print "Cards of dealer:"
    count_cards.times { print ' [ * ]'}
    print "\n"
  end
end
