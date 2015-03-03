class MyClass
  private
  def privmethod(n)
    puts "Inside #{__method__}"
    n**2
  end
end

my_obj = MyClass.new

puts my_obj.public_methods
puts my_obj.privmethod(2) rescue puts "exception raised"
puts my_obj.send(:privmethod,2)
