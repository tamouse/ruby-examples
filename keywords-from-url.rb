require 'open-uri'
require 'nokogiri'

url="http://wiki.tamaratemple.com/"
content=Nokogiri::HTML(open(url))
keywords=content.search('//meta[@name="keywords"]').attr('content').value
puts keywords
