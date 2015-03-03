STOPWORDS=%w[a an and in of].freeze
def proper_title(t)
  t.to_s.split.inject([]) do |m, x|
    if m.empty? || ! STOPWORDS.include?(x)
      m << x.capitalize
    else
      m << x
    end
  end.join(" ")
end
