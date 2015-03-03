require 'spec_helper'

describe SnowTires do
  let(:car) {
    c = Car.new
    c.extend(SnowTires)
    c
  }

  it "should have class method max_speed" do
    expect(SnowTires.instance_methods).to include(:max_speed)
  end
  it "should have a max_speed" do
    expect(car).to respond_to(:max_speed)
  end

end
