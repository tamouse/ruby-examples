require 'Deck.rb'
require 'Player.rb'


class Game
  def initialize(players)
    raise "No players" if players.nil? || players !== Integer ||
      players < 1 || players > 8
    @deck = Deck.new
    @players = 1.upto(players).to_a.map do |i|
      Player.new("player#{i}",@deck);
    end
  end
end
