# EXTRACTURLS.RB
#
# *Author*::      Tamara Temple <tamara@tamaratemple.com>
# *Since*::       2012-12-17
# *Version*::     0.0.1
# *Copyright*::   (c) 2012 Tamara Temple Web Development
# *License*::     MIT
#
#--

require 'nokogiri'
 
def extract (doc)
	doc.search("a.thumb").each do |a|
		puts a.attribute('href')
	end
end

while ARGV do |file|
  puts "scanning #{file}"
  File.open(file) do |f|
    extract(f.read)
  end
end
