require 'spec_helper'

describe Car do
  let(:car) { Car.new }
  let(:greencar) { Car.new colour: :green }
  let(:fivedoor) { Car.new doors: 5 }
  it "should be a Car" do
    car.should be_a(Car)
  end
  it "should be a blue car" do
    car.colour.should be :blue
  end
  it "should have 4 doors" do
    car.doors.should be 4
  end
  it "should be a green car" do
    greencar.colour.should be :green
  end
  it "should be a five door" do
    fivedoor.doors.should be 5
  end
end
