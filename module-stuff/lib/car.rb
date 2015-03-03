class Car 
  
  attr_accessor :colour, :doors

  def initialize(options={})
    @colour = options.fetch(:colour) { :blue }
    @doors = options.fetch(:doors) { 4 }
  end
  
end
