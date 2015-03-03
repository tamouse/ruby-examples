require 'spec_helper'
require 'Card'

describe Card do

  it "responds to :new" do
    Card.should respond_to(:new)
  end

  context "should make a new card" do
    let(:card) {Card.new(0,:hearts)}
    it {card.should be_a(Card)}
    it {card.rank.should == 0}
    it {card.suit.should == :hearts}
    it {card.long_name.should == "Duece of Hearts"}
    it {card.short_name.should == "2H"}
    it {card.to_s.should == card.long_name}
    it {card.value.should == 40}
  end


end