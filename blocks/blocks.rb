require 'minitest/autorun'

class List
  include Enumerable

  def initialize()
    @notes = []
    yield @notes if block_given?
  end

  attr_reader :notes

  def each &block
    @notes.each &block
  end
end

class Note
  attr_accessor :from, :to, :note
  def initialize(attributes={})
    self.from = attributes[:from]
    self.to   = attributes[:to]
    self.note = attributes[:note]
  end

  def to_s
    "From: #{from} To: #{to} Note: #{note}"
  end
end


class SimpleTestCase < MiniTest::Unit::TestCase
  def setup
    @list = List.new do |notes|
      notes << Note.new(from: "Josh", to: "Derek", note: "I'm going to be late tonight")
      notes << Note.new(from: "Derek", to: "Josh", note: "I'm not surprised")
      notes << Note.new(from: "Mo", to: "Derek", note: "Don't worry, I'll be there")
      notes << Note.new(from: "Derek", to: "Mo", note: "Thanks, Mo!")
    end
  end

  def test_select
    selected = @list.select { |note| note.from == "Derek" }
    assert_equal 2, selected.size
    assert_equal "From: Derek To: Josh Note: I'm not surprised", selected.first.to_s
    assert_equal "From: Derek To: Mo Note: Thanks, Mo!", selected.last.to_s
  end

  def test_detect
    detected = @list.detect { |note| note.to == "Josh" }
    assert_equal "From: Derek To: Josh Note: I'm not surprised", detected.to_s
  end
end
