# TITLECASE.RB
#
# *Author*::      Tamara Temple <tamara@tamaratemple.com>
# *Since*::       2012-12-06
# *Version*::     0.0.1
# *Copyright*::   (c) 2012 Tamara Temple Web Development
# *License*::     MIT
#
#--

=begin rdoc
  
   In ruby, the String class includes methods for converting to upper
   and lower case (upcase and downcase). It doesn't seem to include the
   conversion to title case, however, much less the opportunity to
   include stop words (words which will not be converted).

   This is a quick example to show how to add a method to String that
   will do this.

=end 

class String

=begin rdoc

   The titlecase method will return a string where the words in phrase
   are converted to capitalized words, unless a word is in the list of
   stopwords. The first word will be capitalized regardless of whether
   it's in the stopword list or not.

   You can pass in your own list of stopwords as well.

=end
  def titlecase!(stopwords=%w{and or and/or a an the of})
    self.gsub!(/\w+/){|w| stopwords.include?(w.downcase) ? w.downcase
      : w.capitalize}
    self[0]=self[0].upcase!
    self
  end
  def titlecase(stopwords=%w{and or and/or a an the of})
    t = self.dup
    t.titlecase!
  end
end
