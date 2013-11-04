require 'highline/import'

ok = ask("Ok?") {|q| q.validate = /\A[yn]\Z/i }.downcase
say "you gave #{ok}"
