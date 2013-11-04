#!/usr/bin/env ruby

# Read-Eval-Print Loop basic command processor

MenuItem = Struct.new :label, :action


@commands = [
             MenuItem.new('Quit',:quit),
             MenuItem.new('Do thing 1',:thing1),
             MenuItem.new('Do thing 2',:thing2)
            ]




def thing1
  "THING ONE RULES!!"
end

def thing2
  "THING TWO FTW!"
end

def show_menu
  @commands.each_index do |key|
    puts "#{key} - #{@commands[key].label}"
  end
end

def prompt(p='> ')
  print p
  gets.chomp.downcase
end

def valid?(response)
  response.match(/[0-9]+/) and response.to_i < @commands.count and response.to_i >= 0
end

def perform(request)
  self.send(@commands[request].action)
end

loop do
  show_menu
  request = prompt
  if valid?(request)
    request = request.to_i
    break if request == 0
    puts perform(request)
  else
    puts "Unknown request #{request}. Try again"
  end
end 
