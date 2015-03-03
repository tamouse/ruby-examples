require 'Card'

class Deck

  def initialize
    @deck = [:clubs, :diamonds, :hearts, :spades].inject([]) do |a, suit|
      (0..12).each do |rank|
        a << Card.new(rank,suit)
      end
      a
    end
    @deck.shuffle!
  end

  def deal(num_cards)
    (1..num_cards).inject([]) do |hand, card|
      hand << deal_card
      hand
    end
  end

  def deal_card
    raise "No more cards!" if @deck.length < 1
    @deck.shift
  end

  def cards_left
    @deck.length
  end
  
end
