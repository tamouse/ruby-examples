require "ClassVarTest/version"

class ClassVarTest
  @@mock = false

  def mock?()
    @@mock
  end
  def self.mock?()
    @@mock
  end
  def self.mock!
    @@mock = true
  end
  def self.unmock!()
    @@mock = false
  end
  def self.toggle_mock
    @@mock = !@@mock
  end

end
