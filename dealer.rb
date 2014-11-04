class Dealer
  attr_reader :deck

  def intialize(deck)
    @deck = deck
  end

  def deal_card
    deck.pop
  end

  def deal(players)
    5.times do
      players.each do |player|
        player.hand << dealer.deal_card
      end
    end
  end

  def shuffle_deck
    deck.shuffle
  end
end
