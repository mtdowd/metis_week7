class GameResultsPrinter
  def initialize(players)
    @players = players
  end

  def print
    players.each do |player|
      print_heading(player)
      print_hand(player)
      print_highest_hand(player)
      puts "\n"
    end
  end

  def print_heading(player)
    puts player.name
    puts "-" * player.name.length
  end

  def print_hand(player)
    player.show_hand
  end

  def print_highest_hand(player)
    evaluator = HandEvaluator.new(player.hand)
    evaluator.evaluate
  end
end
