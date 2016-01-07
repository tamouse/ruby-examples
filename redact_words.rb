
class Redactor
  attr_accessor :redactions

  def initialize(redact_words = '')
    self.redactions = redact_words
  end

  def redactions=(redact_words = '')
    if Array === redact_words
      @redactions = redact_words.map{|x| x.to_s.downcase}
    else
      @redactions = redact_words.to_s.chomp.downcase.split(" ")
    end
  end

  def redact(text='')
    text.to_s.chomp.split(" ").map do |word|
      if redactions.include? word.downcase
        "[REDACTED]"
      else
        word
      end
    end.join(" ")
  end
end

def test(redactor, original, redactions=nil)
  redactor.redactions = redactions unless redactions.nil?
  puts "\nOriginal text: #{original.inspect}"
  puts "Redactions: #{redactor.redactions}"
  puts "Redacted text: #{redactor.redact(original).inspect}"
end

original = "Now is the time for all good mice to come to the aid of their cheese"
redactions = "is the to"
redactor = Redactor.new(redactions)
test(redactor, original, redactions)
test(redactor, original,  "now time cheese")
test(redactor, original,  "")
test(redactor, original,  nil)
test(redactor, original,  %w[Mice Cheese])
test(redactor, original,  [7, 12, "cheese"])

redactor.redactions = "is the to"
test(redactor, '')
test(redactor, nil)
test(redactor, 17)
test(redactor, [1, 2, 3, 4, 5])

o = (redactor.redactions * 5).shuffle.join(" ")
test(redactor, o)
