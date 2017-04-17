module Result

  private

  def result
    if @dealer.count_scores == @player.count_scores || @dealer.count_scores > 21 && @player.count_scores > 21
      draw
    elsif @player.count_scores > 21
      dealer_win
    elsif @dealer.count_scores > 21
      player_win
    elsif diff_scores(@dealer) < diff_scores(@player)
      dealer_win
    elsif diff_scores(@player) < diff_scores(@dealer)
      player_win
    end
  end

  def draw
    puts "Draw!"
    sum = @bank.sum / 2
    @bank.transfer(@dealer.account, sum)
    @bank.transfer(@player.account, sum)
    puts "The dealer and the player transferred to #{sum} dollars"
  end

  def dealer_win
    puts "Dealer win!"
    puts "The dealer was transferred #{@bank.sum} dollars"
    @bank.transfer(@dealer.account, @bank.sum)
  end

  def player_win
    puts "Player win!"
    puts "The player was transferred #{@bank.sum} dollars"
    @bank.transfer(@player.account, @bank.sum)
  end

  def diff_scores(member)
    21 - member.count_scores
  end
end