class Player
  @cards = []

  def initialize(name)
    @name = name
    @account = new.Account
    raise 'Name can not be empty' if name.empty?
  end

  def take_card
  end

  def count_scores
    #туз 1 или 11
    sum = 0
    @cards.each do |card|
    end
  end

end
