#!/usr/bin/env ruby

puts "Enter the tags for this post: "
tags = gets.chomp

date = Time.now.to_s.split(' ').first
args = ARGV


STDERR.puts date
STDERR.puts args

file_title = args.join("-")
post_title = args.join(" ")

STDERR.puts file_title
STDERR.puts post_title

STDERR.puts "#{date}-#{file_title}.md"

File.open("#{date}-#{file_title}.md", "w") {|post|
  post.write("
---\n
layout: post\n
title: #{post_title}\n
tags: #{tags}
---\n
")
}

#$ ./make.rb asdf asdf
#Enter the tags for this post: 
#./make.rb:6:in `gets': No such file or directory @ rb_sysopen - asdf (Errno::ENOENT)#
#	from ./make.rb:6:in `gets'
#	from ./make.rb:6:in `<main>'
