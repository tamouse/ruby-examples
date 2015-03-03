# -*- coding: utf-8 -*-
# MIXEDENCODING.RB
#
# *Author*::      Tamara Temple <tamara@tamaratemple.com>
# *Since*::       2012-12-16
# *Version*::     0.0.1
# *Copyright*::   (c) 2012 Tamara Temple Web Development
# *License*::     MIT
#
#--

# get the source file
quotes = IO.readlines(ARGV.shift)

quotes.collect! do |q|
  if q.force_encoding("UTF-8").valid_encoding?
    q.gsub!(/¶/, "\n")
  else
    q = q.force_encoding("ISO-8859-1").
      gsub(/#{0xb6.chr.force_encoding("ISO-8859-1")}/, "\n")
  end
  q
end

quotes.each { |q| puts q; puts "\n" }
