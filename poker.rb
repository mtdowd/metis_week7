require_relative "card"
require_relative "deck"
require_relative "hand"

class Game

  SUITS = ["H", "S", "D", "C"]
  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]

  def play
    get_deck
    show_cards
    get_players
    deal_cards
    show_hands
    evaluate_hands
    # show_best_hand
  end

  def get_deck
    cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    @deck = Deck.new(cards)
  end

  def show_cards
    @deck.cards.each do |card|
      print card.value + card.suit + " "
    end
    puts
    puts "You have a fresh deck!"
  end

  def get_players
    print "How many players are playing (max is 10)?"
    @num_players = gets.chomp.to_i
    @players = Array.new(@num_players)
  end

  def deal_cards
    @deck.shuffle_deck
    count = 0
    playing_cards = []
    while count < @num_players do
      5.times do
        playing_cards << @deck.cards.pop
      end
      @players[count] = Hand.new("Player "+"#{count + 1}", playing_cards)
      count += 1
      playing_cards = []
    end
  end

  def show_hands
    @players.each do |player|
      puts player.name
      player.playing_cards.each do |card|
        puts card.value + card.suit
      end
      puts
    end
  end

  def evaluate_hands
    # @players.each do |player| 
    #   cards = player.cards
    #   player.evaluate(cards)
    # end
  end

end

game = Game.new
game.play
