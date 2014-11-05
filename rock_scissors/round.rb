class Round

  OPTIONS = ["R","P","S"]

  def initialize
    @win = false
  end

  def play
    get_computer_choice
    evaluate_choices
  end

  def get_computer_choice
    @computer_choice = OPTIONS.sample
    puts "AI played #{@computer_choice}"
  end

  def evaluate_choices
    if @player_choice == @computer_choice
      puts "AI and Player tied"
    else
      if @player_choice == "R"
        if @computer_choice == "P"
          puts "AI beats Player"
        else
          puts "Player beats AI"
          player_win?
        end
      elsif @player_choice == "P"
        if @computer_choice == "S"
          puts "AI beats Player"
        else
          puts "Player beats AI"
          player_win?
        end
      else
        if @computer_choice == "R"
          puts "AI beats Player"
        else
          puts "Player beats AI"
          player_win?
        end
      end
    end
  end

  def player_win?
    @win = true
  end

end
