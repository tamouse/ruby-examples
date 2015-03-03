require 'spec_helper'

describe ClassVarTest do
  it{should be_a(ClassVarTest)}


  it "should return false for class mocking" do
    ClassVarTest.mock?.should be_false
  end

  it "should return false for instance mocking" do
    ClassVarTest.new.mock?.should be_false
  end

  context "set mock true at class level" do
    before(:each) do
      ClassVarTest.mock!
    end
    after(:each) do
      ClassVarTest.unmock!
    end
    it "should return true for class mocking" do
      ClassVarTest.mock?.should be_true
    end
    it "should return true for instance mocking" do
      ClassVarTest.new.mock?.should be_true
    end



  end


end
