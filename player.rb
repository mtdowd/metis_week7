class Player
  attr_accessor :number, :hand

  def initialize(number)
    @number = number
  end

  def name
    "Player #{number}"
  end

  def show_hand
    hand.each do |card|
      puts card.to_s
    end
  end

  def hand
    @hand ||= []
  end
end
