def splatargdeflate(args,argnames)
  return args unless args.is_a?(Array)
  return args if args.length < 1

  if args.last.is_a?(Hash)
    last_arg = args.pop
  else
    last_arg = {}
  end

#  arg_hash={}

#  argnames.each_index do |i|
#    arg_hash[argnames[i]] = args.shift
#  end

  arg_hash = argnames.reduce(h={}){|h,n| h[n]=args.shift;h}


  arg_hash.merge!(last_arg)
  args.unshift arg_hash
end
 
def foo(*args)
  args = splatargdeflate(args,[:first, :second, :third])
  puts args.inspect
end

puts foo
puts foo(1)
puts foo(1,2)
puts foo('a', 'b', 'c')
puts foo('a', 'b', third: 'blah')
puts foo('a', 'b', first: 'butno')
puts foo(nil, nil, nil)
puts foo(({z: 1, x: 2}), 'bazinga!', third: 17)
puts foo(1,2,3,4,5,6,7,8,9,10)
