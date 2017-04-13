class Dealer < Member
  
  def show_cards
    print "Cards of dealer:"
    count_cards.times { print ' [ * ]' }
    print "\n"
  end
  
end
