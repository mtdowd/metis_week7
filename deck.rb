class Deck
  attr_reader :cards

  SUITS = ["H","S","D","C"]
  RANKS = 2..14

  def display
    cards.each do |card|
      print card.to_s + " "
    end
  end

  def shuffle
    cards.shuffle!
  end

  def pop
    cards.pop
  end

  def cards
    @cards ||= generate_deck
  end

  private

  private_constant :SUITS, :RANKS

  def generate_deck
    SUITS.flat_map do |suit|
      RANKS.map do |rank|
        Card.new(suit, rank)
      end
    end
  end

end
