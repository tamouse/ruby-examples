require 'spec_helper'
require 'Player.rb'

describe Player do
  it "responds to :new" do
    Player.should respond_to(:new)
  end
end