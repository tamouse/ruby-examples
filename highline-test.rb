#!/usr/bin/env ruby

require 'highline/import'

ok = ask("Ok?") {|q| q.validate = /\A[yn]\Z/i }.downcase
say "you gave #{ok}"

stderr = HighLine.new($stdin, $stderr)

stderr.say('<%= color("Should be on stderr", :red) %>')
