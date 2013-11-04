=begin rdoc

= BEERSONG.RB

*Author*::      Tamara Temple <tamara@tamaratemple.com>
*Since*::       2013-03-26
*Copyright*::   (c) 2013 Tamara Temple Web Development
*License*::     MIT
  
=end

def beersong(bb=99)

  bb.downto(1) do |n|

    puts <<SONG
#{n} bottles of beer on the wall,
#{n} bottles of beer!
Take one down and pass it around,
#{n>1 ? n-1 : "No more"} bottles of beer on the wall!

SONG
    
  end

  puts " .. they all fell down drunk!"

end

