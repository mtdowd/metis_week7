
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def shuffle_deck
    @cards.shuffle!
  end
end
