require "./round"

class Game
  attr_accessor :rounds, :player_wins

  def initialize
    @rounds = 0.0
    @player_wins = 0
  end

  def play
    welcome_banner
    get_player_choice
    while player_keep_playing?
      round = Round.new
      round.play
      self.rounds += 1
      puts rounds
      self.player_wins += 1 if round.player_win?
      puts player_wins
      get_player_choice
    end
    farewell_banner
  end

  private

  def welcome_banner
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def get_player_choice
    print "Your move? (R/P/S, q to quit): "
    @player_choice = gets.chomp.upcase
  end

  def player_keep_playing?
    if @player_choice == "Q"
      return false
    end
    return true
  end

  def farewell_banner
    puts "Thanks for playing!"
    win_percentage = (@player_wins/@rounds) * 100
    puts "You won #{win_percentage}% of the hands."
  end
end

game = Game.new
game.play
