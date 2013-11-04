def beersong(bb=99)

  bb.downto(1) do |n|

    puts <<SONG
#{n} #{bottles(n)} of beer on the wall,
#{n} #{bottles(n)} of beer!
Take one down and pass it around,
#{n>1 ? n-1 : "No more"} #{bottles(n-1)} of beer on the wall!

SONG
    
  end

  puts " .. they all fell down drunk!"

end

def bottles(n)
  "bottle#{(n == 1)?"":"s"}"
end

beersong(2)
