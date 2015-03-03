require 'spec_helper'
require 'Game'

describe Game do
  it "responds to :new" do
    Game.should respond_to(:new)
  end

end