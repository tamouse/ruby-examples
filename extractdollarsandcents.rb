#!/usr/bin/env ruby
#
# Example showing String#match method
#
# Copyright (C) 2015 by Tamara Temple Web Development
# License: MIT
# Author: Tamara Temple <tamouse@gmail.com>
#

#
# Examples
#
prices = [
  '$ 5.99/LB',
  '$5.99 /LB',
  '5.99 / lb',
  '........',
  '0.0.0.0.0.0.',
  '10ffff'
]

results = prices.map do |str|
  print "#{str}: "
  matches = str.match(/[.\d]+/)
  print "matches: #{matches} "
  price = matches[0].to_f
  puts "price: #{price}"
  price
end

puts "Results:\n#{results}"

