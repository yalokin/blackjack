class Deck

  SUITS = ['+', '<3', '^', '<>'].freeze
  CARDS = {
    '2' => 2, '3'  => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
    '9' => 9, '10' => 10, 'K' => 10, 'J' => 10, 'Q' => 10, 'A' => 1
  }

  def initialize
    make_deck
  end

  def make
    @deck = []
    SUITS.each do |suit|
      CARDS.each do |key, value|
      @deck << [key + suit, value]
      end
    end
  end

  def give_card
    raise 'The deck is over' if @deck.size.zero?
    @deck.shuffle!
    card = @deck[0]
    @deck.delete_at[0]
    card
  end

end
