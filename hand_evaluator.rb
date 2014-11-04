class HandEvaluator
  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  def evaluate
    # ranks = []
    # suits = []
    #
    # hand.each do |card|
    #   ranks << card.rank
    #   suits << card.suit
    # end
    #
    if straight_flush?
      "straight flush"
    elsif of_a_kind?(4)
      "four of a kind"
    elsif full_house?
      "full house"
    elsif flush?
      "flush"
    elsif straight?
      "straight"
    elsif of_a_kind?(3)
      "three of a kind"
    elsif two_pair?
      "two pair"
    elsif pair?
      "pair"
    else
      "High card #{high_card}"
    end
  end

  def straight_flush?
    flush? && straight?
  end

  def flush?
    cards.map(&:suit).uniq.count == 1
  end

  def straight?
    straight_range.to_a == cards.map(&:rank).sort
    # sorted_ranks = ranks.sort
    # if sorted_ranks.uniq.count == 5
    #   if sorted_ranks.last - sorted_ranks.first == 4
    #   end
    # end
  end

  def of_a_kind?(number)
    cards.group_by(&:rank).any? {|rank, group| group.length == number }
    # frequency_map.each_key do |key|
    #   if frequency_map[key] == number
    #     return true
    #   end
    # end
    #
    # false
  end

  def full_house?
    of_a_kind?(3) && of_a_kind(2)
    # frequency_map.keys.length == 2
  end

  def two_pair?
    cards.group_by(&:rank).keys.length == 3
  end

  def pair?
    of_a_kind?(2)
    # frequency_map.keys.length == 4
  end

  def high_card
    cards.max_by(&:rank)
    # sorted_hand = hand.sort_by { |card| card.rank }.reverse
    # sorted_hand[0]
  end

  def low_card
    cards.min_by(&:rank)
  end

  # def frequency_map
  #   cards.group_by(&:rank)
    # @frequency_map ||= build_frequency_map
  # end

  def straight_range
    low_card.rank..high_card.rank
  end

  # def build_frequency_map
  #   hash = {}
  #   ranks.each do |rank|
  #     if has.has_key? rank
  #       hash[rank] += 1
  #     else
  #       hash[rank] = 1
  #     end
  #   end
  # end
end
