#!/usr/bin/env ruby
=begin rdoc

= REPL2.RB

*Author*::      Tamara Temple <tamara@tamaratemple.com>
*Since*::       2013-03-25
*Copyright*::   (c) 2013 Tamara Temple Web Development
*License*::     MIT

A REPL implementation, which some smarts
  
=end

class Actions
  def thing1
    "THING ONE IS THE BEST"
  end

  def thing2
    "THING TWO FOR THE WIN"
  end
end

class Menu
  
  MenuItem = Struct.new :label, :action
  attr_reader :menu

  def initialize(actions=Actions)
    raise "actions must be a class! #{actions.class}" unless actions.is_a? Class

    action_methods = actions.instance_methods(false)
    STDERR.puts "#{actions} methods: #{action_methods}"

    @menu = Array.new

    @menu << MenuItem.new("quit",nil)

    action_methods.each do |a|
      @menu << MenuItem.new(a.to_s, a)
    end
  end
  
  def show
    puts "Select item by number:"
    @menu.each_index do |i|
      puts "#{i} - #{@menu[i].label}"
    end
    puts
  end

  def valid?(item)
    item.match(/^\d+$/) and item.to_i < @menu.count and item.to_i >= 0
  end


  def perform(item)
    return false unless valid?(item)
    Actions.new.send(@menu[item.to_i].action) unless @menu[item.to_i].nil?
  end

end

def prompt(p='> ')
  print p
  gets.chomp
end


menu = Menu.new(Actions)

loop do
  menu.show
  request = prompt()
  if menu.valid?(request)
    break if request == '0'
    puts menu.perform(request)
  else
    puts "Unknown request #{request}. Try again."
  end
end

puts "Thanks for playing!"
  
  



