def drill(f,&blk)
  Dir.foreach(f) do |f|
    next if %w[. ..].include?(f)
    puts f
    drill(f, &blk) if File.directory?(f)
  end
  yield f
end

start = '.'
drill(start) {|i| puts i}
