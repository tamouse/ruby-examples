input = ['11','12','12','12','11','11','12','44','44']

p input

prev = 0
output = input.slice_before do |e|
  prev = prev + 1
  puts "#{prev} #{input[prev]} #{e}"
  input[prev] == e
end.to_a

p output
