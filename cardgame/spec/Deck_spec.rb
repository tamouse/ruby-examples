require 'spec_helper'
require 'Deck'
require 'Card'

describe Deck do
  it "responds to :new" do
    Deck.should respond_to(:new)
  end
  it "a new deck has 52 cards" do
    deck = Deck.new
    deck.cards_left.should == 52
  end
  context "dealing" do
    let(:deck) {Deck.new}
    it "deals a card" do
      card = deck.deal_card
      card.should be_a(Card)
      (0..12).include?(card.rank).should be_true
      [:clubs, :diamonds, :hearts, :spades].include?(card.suit).should be_true
    end
    it "deals a hand" do
      hand = deck.deal(5)
      hand.should be_an(Array)
      hand.length.should == 5
      hand.each{|c| c.should be_a(Card)}
    end
    
    it "only deals 52 cards" do
      hand = deck.deal(52)
      expect {deck.deal_card}.to raise_exception("No more cards!")
    end
  end
end