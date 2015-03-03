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
require 'open-uri'

doc = Nokogiri::HTML(open('http://news.nationalgeographic.com/news/2012/12/pictures/121211-best-space-2012-endeavour-mars-rover-nasa-science/?source=email_inside&utm_source=NatGeocom&utm_medium=Email&utm_content=inside_20121215&utm_campaign=Content'))

doc.css("a.thumb").each do |imagelink|
  %x{wget -a wget.log #{imagelink.attributes['href'].value} }
  imgtxtfn = File.basename(imagelink.attributes['href'].value)
  File.open("#{imgtxtfn}.html",'w') do |imgtxt|
    imgtxt.puts imagelink.next_element
  end
end
