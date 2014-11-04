
class Hand
  attr_reader :name, :playing_cards

  def initialize(name, playing_cards)
    @name = name
    @playing_cards = playing_cards
  end
end
