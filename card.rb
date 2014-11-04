class Card
  attr_reader :suit, :rank

  DISPLAY_VALUES = {
    11 => "J",
    12 => "Q",
    13 => "K",
    14 => "A"
  }

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank}#{suit}"
  end

  def display_rank
    if DISPLAY_VALUES.has_key? rank
      DISPLAY_VALUES[rank]
    else
      rank
    end
  end
end
