
class TwoOrThree

  attr_accessor :value

  def initialize(value)
    self.value = value
  end

  def each
    return enum_for(:each) unless block_given?

    loop do
      yield self.value

      if self.value.odd?
        self.value = self.value * 3
      else
        self.value = self.value / 2
      end

    end
      
  end

end
