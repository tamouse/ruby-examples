=begin rdoc

= TESTLEFTLEFT.RB

*Author*::      Tamara Temple <tamara@tamaratemple.com>
*Since*::       2013-02-27
*Copyright*::   (c) 2013 Tamara Temple Web Development
*License*::     MIT
  
=end

class TestLeftLeft

  attr_accessor :a, :s

  def initialize
    @a = Array.new
    @s = String.new
  end

  def <<(obj)
    case obj
    when Array ; @a.concat obj
    when String ; @s.<<(obj)
    else
      raise "Unknown type of object: #{obj.class}"
    end
  end

  def update(method, arg)
    if Array === __send__(method)
      __send__("#{method}") << arg
    else
      __send__("#{method}=",arg)
    end
  end

end 
