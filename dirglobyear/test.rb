#!/usr/bin/env ruby

path = "dirs"
years_pattern = "[12][0-9][0-9][0-9]"

Dir.glob("#{path}/#{years_pattern}/") do |folder|
  puts "The folder name is #{folder}"
  Dir.glob("#{folder}*") do |file|
    puts "The file name is #{file}" if File.file?(file)
  end
end
