class MyClass < Struct.new :stuff, :and, :nonsense
  def initialize
    self.stuff = Array.new
    self.and = Hash.new
    self.nonsense = String.new
  end
  
  include Enumerable

  # Defining the #each method gives a whole lot of other goodies coming from Enumerable
  def each &block
    self.stuff.each do |s|
      if block_given?
        block.call s
      else
        yield s
      end
    end
  end

  # This little ditty appends objects to the stuff inst_var so you can do
  # neat things like:
  #
  #     c << 1 << 'a' << :one
  def << obj
    self.stuff << obj
  end
  
  # Give a nice output for the object
  def to_s
    "#{self.nonsense.to_s} #{self.and.inspect} #{self.stuff.inspect}"
  end
  
  # Provides a means of getting at both containers in the class.
  # Integer values for idx simply return the value at stuff[idx] while
  # Non-Integer values act as keys to the hash and.
  def [] idx
    case idx
    when Integer
      self.stuff[idx]
    else
      self.and[idx]
    end
  end

  # Counterpart to the above, this is the setter
  def []= idx, obj
    case idx
    when Integer
      self.stuff[idx]=obj
    else
      self.and[idx]=obj
    end
  end
  
  # Makes this class's objects comparable, so they can be sorted
  # and other neat tricks.
  include Comparable

  # The basic comparison operator.
  # In this case, it's just the nonsense content that's being compared.
  def <=> other
    self.nonsense <=> other.nonsense
  end

  # This is going to be fun
  ArrayMethods = Array.instance_methods(false)
  HashMethods = Hash.instance_methods(false)
  StringMethods = String.instance_methods(false)


  # If the caller sends a method to us, we dispatch it to the attributes
  # in order of declaration. This is magically accomplished via
  # the method_missing method!
  def method_missing(m, *args)
    STDERR.puts "#{File.basename(__FILE__)}@#{__LINE__} in #{__method__} m: #{m.inspect}, args: #{args.inspect}" if $debug
    if ArrayMethods.include? m
      self.stuff.send(m, *args)
    elsif HashMethods.include? m
      self.and.send(m, *args)
    elsif StringMethods.include? m
      self.nonsense.send(m, *args)
    else
      super
    end
  end
  
end
