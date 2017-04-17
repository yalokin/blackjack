module Result

  # def result
  #   draw if @dealer.count_scores == @player.count_scores || @dealer.count_scores > 21 && @player.count_scores > 21
  #   dealer_win if @player.count_scores > 21 || diff_scores(@dealer) < diff_scores(@player)
  #   dealer_win if 
  #   player_win if @dealer.count_scores > 21 || diff_scores(@player) < diff_scores(@dealer)
  # end

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
  end

  def dealer_win
    puts "Dealer win!"
  end

  def player_win
    puts "player win!"
  end

  def diff_scores(member)
    21 - member.count_scores
  end
end