class Deck

  SUITS = ['+', '<3', '^', '<>'].freeze
  RANKS = {
    '2' => 2, '3'  => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
    '9' => 9, '10' => 10, 'K' => 10, 'J' => 10, 'Q' => 10, 'A' => 1
  }

  def initialize
    make
  end

  def give_card
    raise 'The deck is over' if @deck.size.zero?
    @deck.pop
  end

  private

  def make
    @deck = []
    SUITS.each do |suit|
      RANKS.each do |rank, score|
        @deck << [rank + suit, score]
      end
    end
    @deck.shuffle!
  end

end
