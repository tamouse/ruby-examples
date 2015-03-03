require 'Hand.rb'

class Player
  attr_accessor :name, :hand
  def initialize(name, deck)
    @name = name
    @hand = Hand.new(deck)
  end
end
