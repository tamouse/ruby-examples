class Dataanalysis
  include Enumerable
  attr_reader :lines
  attr_reader :emptylines

  def initialize(filename)
    @filename = filename
    @content = File.readlines(@filename).map(&:chomp)
    @lines = @content.size
    @emptylines = @content.grep(/^\s*$/).size
  end

  def each(&b)
    @content.each do |line|
      if block_given?
        b.call line
      else
        yield line
      end
    end
  end

end
