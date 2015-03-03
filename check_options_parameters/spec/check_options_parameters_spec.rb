require "spec_helper"

describe CheckOptionsParameters do

  it "responds to :new" do
    expect(CheckOptionsParameters).to respond_to :new
  end

  it "validates equal sets" do
    expect(CheckOptionsParameters.new({a: "first", b: "second", c: "third"}, %i[a b c]).validate).to be_true
  end

  it "invalidates missing parameters" do
    expect(CheckOptionsParameters.new({a: "first"}, %i[a b c]).validate).to be_false
  end

  it "invalidates extra parameters" do
    expect(CheckOptionsParameters.new({a: "first", b: "second"}, %i[a]).validate).to be_false
  end

  it "handles nil valid keys" do
    expect(CheckOptionsParameters.new({}, nil).validate).to be_true
  end

  it "handles nil options" do
    expect(CheckOptionsParameters.new(nil, []).validate).to be_true
  end

  it "handles nil options and valid keys" do
    expect(CheckOptionsParameters.new(nil, nil).validate).to be_true
  end

  it "deals with non-hash options" do
    expect{CheckOptionsParameters.new("hi", nil).validate}.to raise_error(TypeError, %r{can\'t convert String into Hash})
  end

  it "deals with non-array valid keys" do
    expect(CheckOptionsParameters.new({}, "hi").validate).to be_false
  end

  it "shows missing options" do
    expect(CheckOptionsParameters.new({a: "first"}, %i[a b c]).missing).to eq(%i[b c])
  end

  it "shows extra options" do
    expect(CheckOptionsParameters.new({a: "first", b: "second", xyz: "extra"}, %i[a b c]).extras).to eq(%i[xyz])
  end

end

