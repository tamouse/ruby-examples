# -*- coding: utf-8 -*-
require 'sqlite3'
db = SQLite3::Database.new ":memory:"
db.query "CREATE TABLE test (id INTEGER PRIMARY KEY, key TEXT, value TEXT)"
db.query "INSERT INTO test(key, value) VALUES(?, ?)", "foo", "baræøå"
puts db.get_first_value "SELECT value FROM test"
