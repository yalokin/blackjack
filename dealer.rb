class Dealer < Member

  def show_cards
    print "Cards of dealer:"
    count_cards.times { print ' [ * ]' }
    print "\n"
  end

  def action
    if count_scores > 17 || count_cards == 3
      puts "Dealer skip move"
      @game.player_action
    else
      take_card(@game.deck.give_card)
      puts "Dealer took the card"
      @game.player_action
    end
  end
end
