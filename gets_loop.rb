#!/usr/bin/env ruby
#
# This was from a question on irc://freenode.net/#ruby
#
# Kernel#gets reads more than just stdin. It uses ARGV* unless it's
# empty, in which case it uses STDIN.
#
#     $ ruby gets_loop.rb
#
# The above will read from stdin.
#
#     $ ruby gets_loop.rb these are some words
#
# Will look for the files "these", "are", "some", and "words" and read
# from them sequentially.

puts "just a loop. ^C to exit"

loop do
  print "> "

  # This will read from ARGF a line at a time
  # command = gets.chomp

  # To make it read *only* from stdin when there are command line
  # arguments, you have to use STDIN explicitly:
  command = STDIN.gets.chomp

  puts "Command: >>#{command.inspect}<<"
end

#
# From the ruby docs:
#
# Returns (and assigns to $_) the next line from the list of files in
# ARGV (or $*), or from standard input if no files are present on the
# command line. Returns nil at end of file. The optional argument
# specifies the record separator. The separator is included with the
# contents of each record. A separator of nil reads the entire
# contents, and a zero-length separator reads the input one paragraph
# at a time, where paragraphs are divided by two consecutive
# newlines. If the first argument is an integer, or optional second
# argument is given, the returning string would not be longer than the
# given value in bytes. If multiple filenames are present in ARGV,
# +gets(nil)+ will read the contents one file at a time.
#
