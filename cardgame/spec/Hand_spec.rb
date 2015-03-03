require 'spec_helper'
require 'Hand.rb'
require 'Deck.rb'

describe Hand do
  it "responds to :new" do
    Hand.should respond_to(:new)
  end
  context "playing a hand" do
    let(:deck) {Deck.new}
    let(:hand) {Hand.new(deck)}
    it "deals a hand" do
      hand.hand.length.should == 5
    end

    it "royal flush" do
      hand.hand=[
        Card.new(12, :hearts),
        Card.new(11, :hearts),
        Card.new(10, :hearts),
        Card.new( 9, :hearts),
        Card.new( 8, :hearts)
      ]
      hand.hand_rank.should == :royal_flush
      hand.score_hand.should == 10000

    end
    
    it "straight flush" do
      hand.hand=[
        Card.new(9, :clubs),
        Card.new(8, :clubs),
        Card.new(7, :clubs),
        Card.new(6, :clubs),
        Card.new(5, :clubs)
      ]
      hand.hand_rank.should == :straight_flush
      hand.score_hand.should == 1006
    end
    
    it "straight" do
      hand.hand=[
        Card.new(9, :clubs),
        Card.new(8, :hearts),
        Card.new(7, :spades),
        Card.new(6, :clubs),
        Card.new(5, :diamonds)
      ]
      hand.hand_rank.should == :straight
      hand.score_hand.should == 1005
    end

    it "flush" do
      hand.hand=[
        Card.new(12, :clubs),
        Card.new(10, :clubs),
        Card.new( 5, :clubs),
        Card.new( 6, :clubs),
        Card.new( 9, :clubs)
      ]
      hand.hand_rank.should == :flush
      hand.score_hand.should == 1004
    end

    it "full_house" do
      hand.hand=[
        Card.new(12, :clubs),
        Card.new(12, :spades),
        Card.new( 5, :clubs),
        Card.new( 5, :spades),
        Card.new( 5, :hearts)
      ]
      hand.hand_rank.should == :full_house
      hand.score_hand.should == 1003
    end
    
    it "four_of_a_kind" do
      hand.hand=[
        Card.new(12, :clubs),
        Card.new(12, :diamonds),
        Card.new(12, :hearts),
        Card.new(12, :spades),
        Card.new( 9, :clubs)
      ]
      hand.hand_rank.should == :four_of_a_kind
      hand.score_hand.should == 1007
    end
    
    it "three_of_a_kind" do
      hand.hand=[
        Card.new(12, :clubs),
        Card.new(12, :diamonds),
        Card.new(12, :hearts),
        Card.new( 0, :spades),
        Card.new( 9, :clubs)
      ]
      hand.hand_rank.should == :three_of_a_kind
      hand.score_hand.should == 1002

    end
    
    it "one_pair" do
      hand.hand=[
        Card.new(12, :clubs),
        Card.new(12, :diamonds),
        Card.new(11, :hearts),
        Card.new( 0, :spades),
        Card.new( 9, :clubs)
      ]
      hand.hand_rank.should == :one_pair
      hand.score_hand.should == 1000
    end
    
    it "two_pair" do
      hand.hand=[
        Card.new(12, :clubs),
        Card.new(12, :diamonds),
        Card.new(11, :hearts),
        Card.new(11, :spades),
        Card.new( 9, :clubs)
      ]
      hand.hand_rank.should == :two_pair
      hand.score_hand.should == 1001
    end

    it "dud" do
      hand.hand=[
        Card.new(10, :spades),
        Card.new(0, :clubs),
        Card.new(2, :diamonds),
        Card.new(7, :hearts),
        Card.new(12, :clubs)
      ]
      hand.hand_rank.should == :dud
      hand.score_hand.should == 70
    end
    
    it "cheating" do
      hand.hand=[
        Card.new(0, :clubs),
        Card.new(0, :diamonds),
        Card.new(0, :hearts),
        Card.new(0, :spades),
        Card.new(0, :clubs)
      ]
      hand.hand_rank.should == :cheating
      hand.score_hand.should < 0
    end
    


    
  end
end