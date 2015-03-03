def beersong(bb=99)

  bb.downto(1) do |n|

    puts <<SONG
#{bottles(n)} of beer on the wall,
#{bottles(n)} of beer!
Take one down and pass it around,
#{bottles(n-1)} of beer on the wall!

SONG
    
  end

end

def bottles(n)
  "#{n > 0 ? n : "No more"} bottle#{(n == 1) ? "" : "s"}"
end

beersong(2)
