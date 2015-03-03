class Pyramid 
  
  attr_accessor :size
  attr_accessor :pyramid

  def initialize(size)
    self.size = size
    self.pyramid = _make_pyramid
  end
  
  def to_s
    @pyramid.map{|a| a.join(" ")}.map{|a| a.center(@size * 2 + 2)}.join("\n") + "\n"
  end

  private

  def _make_pyramid
    [].tap do |a|
      @size.times do |n|
        a << (1..(n+1)).to_a.reverse
      end
    end
  end

end

