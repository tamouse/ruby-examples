# require 'open-uri'
require 'nokogiri'

test_site = "http://www.xxxx.albea.com/xx"
doc = Nokogiri::HTML(open(test_site))
