#!/usr/bin/env ruby
#
# EXTRACTURLS.RB
#
# Time-stamp: <2015-03-03 08:48:44 tamara>
# Copyright (C) 2015 by Tamara Temple Web Development
# License: MIT
# Author: Tamara Temple <tamouse@gmail.com>
#
#--

require 'nokogiri'
require 'open-uri'
 
def extract (doc)
  doc.search("a").map do |a|
    a.attribute('href')
  end
end

ARGV.each do |file|
  puts "scanning #{file}"
  urls = open(file) do |f|
    extract(Nokogiri::HTML(f.read))
  end
  puts "URLs found:"
  puts urls.join("\n")
end
