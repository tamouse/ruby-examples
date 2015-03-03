#!/usr/bin/env ruby
# Extract Images from Nat Geo Page and save them along with
# explanatory text.
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
require 'fileutils'
require 'uri'

NATGEO = 'http://news.nationalgeographic.com/news/2012/12/pictures/121211-best-space-2012-endeavour-mars-rover-nasa-science/?source=email_inside&utm_source=NatGeocom&utm_medium=Email&utm_content=inside_20121215&utm_campaign=Content'

doc = Nokogiri::HTML(open(NATGEO))

dir = "./extractimagesfromnatgeopage/saved.#{Time.now.strftime("%Y%m%d%H%M%S")}"
FileUtils.mkdir_p(dir)

puts "Saving to #{dir}\n"

Dir.chdir(dir) do |save_dir|
  doc.css("a.thumb").each do |imagelink|
    url = imagelink.attributes['href'].value
    scheme = url.scan(/^https?:/).first
    url = "http:" + url unless scheme
    uri = URI.parse(url)
    puts "Getting #{uri}"
    %x{wget -a wget.log #{uri} }
    imgtxtfn = File.basename(imagelink.attributes['href'].value)
    File.open("#{imgtxtfn}.html",'w') do |imgtxt|
      imgtxt.puts imagelink.next_element
    end
  end
end
