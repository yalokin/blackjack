class Dealer < Member

  def show_back_cards
    print "Cards of dealer:"
    count_cards.times { print ' [ * ]' }
    print "\n"
  end

  def action
    if count_scores > 17 || count_cards == 3
      puts "Dealer skip move"
    else
      take_card(@game.deck.give_card)
      puts "Dealer took the card"
    end
  end

end
