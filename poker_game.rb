class Poker
  attr_reader :dealer, :num_players

  def initialize(num_players = 4)
    @num_players = num_players

    deck = Deck.new
    @dealer = Dealer.new(deck)
  end

  def deal
    dealer.shuffle_deck
    dealer.deal(players)
    GameResultsPrinter.new(players).print
  end

  def players
    @players ||= num_players.times.map do |number|
      Player.new(number+1)
    end
  end
end
