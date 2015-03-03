# require 'Card'

class Hand
  attr_accessor :hand
  
  @@hand_score = {cheating: -10000, one_pair: 1000, two_pair: 1001,
    three_of_a_kind: 1002, full_house: 1003, flush: 1004, straight: 1005,
    straight_flush: 1006, four_of_a_kind: 1007, royal_flush: 10000}

  def initialize(deck)
    self.hand= deck.deal(5)
  end
  
  def hand=(dealt_hand)
    @hand = dealt_hand
    @ranks = get_ranks
    @max_rank = @ranks.sort.last
  end

  def hand_rank
    return :royal_flush if royal_flush?
    return :straight_flush if straight_flush?
    return :straight if straight?
    return :flush if flush?

    
    rank_frequency = get_card_counts

    case rank_frequency.length
    when 5; return :dud
    when 4; return :one_pair
    when 3; return three_of_a_kind_or_two_pair?(rank_frequency)
    when 2; return four_of_a_kind_or_full_house?(rank_frequency)
    when 1; return :cheating
    end
    
  end

  def score_hand
    hand_ranking = self.hand_rank
    return @@hand_score[hand_ranking] if @@hand_score.has_key?(hand_ranking)
    @hand.reduce(@hand.first.value) do |high_card, card|
      high_card = card.value if high_card < card.value
      high_card
    end
  end

  def three_of_a_kind_or_two_pair?(rank_frequency)
    if max_freq(rank_frequency) == 2
      :two_pair
    else
      :three_of_a_kind
    end
  end

  def four_of_a_kind_or_full_house?(rank_frequency)
    if max_freq(rank_frequency) == 4
      :four_of_a_kind
    else
      :full_house
    end
  end

  def flush?
    @hand.map{|card| card.suit}.uniq.length == 1
  end

  def straight?
    sorted_ranks = @ranks.sort
    (0..(sorted_ranks.length-2)).reduce(false) do |result, i|
      result = sorted_ranks[i+1] == sorted_ranks[i] + 1
    end
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    straight_flush? && @max_rank == 12
  end

  def get_ranks
    @hand.map{|card| card.rank}
  end

  def max_freq(freq)
    freq.each_key.reduce(0){|max, k| max = freq[k] if freq[k] > max; max}
  end

  def get_card_counts 
    @ranks.reduce(Hash.new{|hash,key| hash[key] = 0}) do |h,r|
      h[r] += 1
      h
    end    
  end

end
