require 'spec_helper'

describe Studs do
  let(:car) {
    c = Car.new
    c.extend(SnowTires)
    c
  }
  it "Studs should respond to :has_studs?" do
    expect(Studs.instance_methods).to include(:has_studs?)
  end
  it "car should have public method :has_studs?" do
    expect(car.public_methods).to include(:has_studs?)
  end
  it "Car should not have class method :has_studs?" do
    expect(Car).not_to respond_to :has_studs?
  end
  it "car should not have class method :has_studs?" do
    expect(car.class.methods).not_to include(:has_studs?)
  end
  it "car should have studs" do
    expect(car.has_studs?).to be_true
  end
end
