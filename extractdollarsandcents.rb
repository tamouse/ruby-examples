prices = [
          '$ 5.99/LB',
          '$5.99 /LB',
          '5.99 / lb',
          '........',
          '0.0.0.0.0.0.',
          '10ffff'
          
]

results = prices.map do |str|
  puts "#{str}: "
  matches = str.match(/[.\d]+/)
  puts matches
  price = matches[0].to_f
  puts price
  price
end

p results
