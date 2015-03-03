class RubyAssignmentDemo 
  
  attr_accessor :a_field

  def to_s
    @a_field.to_s
  end

  def a_field=(*args)
    @a_field = args
    "HA HA"
  end


end

demo = RubyAssignmentDemo.new

puts demo.a_field = %w{a fine mess}
puts demo.a_field
puts demo.inspect
puts demo.to_s
