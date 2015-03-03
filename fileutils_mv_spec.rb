require 'fileutils'
require 'tmpdir'

# Example showing what the :noop, :verbose, :force and :preserve options do
# on FileUtils.mv

# A little utility method to let us work
# safely working inside a temporary directory.
# call with a block to do the actual work
def in_tmpdir(&b)
  Dir.mktmpdir do |dir|
    Dir.chdir(dir) do |dir|

      yield dir
      
    end
  end
end


describe "FileUtils Tests" do
  
  it "should not move the files, but tell us what it will do" do
    in_tmpdir do |dir|
      FileUtils.mkdir "x_dest"
      FileUtils.touch ("a".."e").map{|f| f+".txt"}
      Dir["*"].sort.should eq ["a.txt","b.txt","c.txt","d.txt","e.txt","x_dest"]
      FileUtils.mv Dir["*.txt"], "x_dest", :noop => true, :verbose => true
      Dir["*"].sort.should eq ["a.txt","b.txt","c.txt","d.txt","e.txt","x_dest"]
      FileUtils.mv Dir["*.txt"], "x_dest", :noop => true, :verbose => false
      Dir["*"].sort.should eq ["a.txt","b.txt","c.txt","d.txt","e.txt","x_dest"]
      FileUtils.mv Dir["*.txt"], "x_dest", :noop => false, :verbose => true
      Dir["*"].sort.should eq ["x_dest"]
      Dir["x_dest/*"].sort.should eq ["x_dest/a.txt","x_dest/b.txt","x_dest/c.txt","x_dest/d.txt","x_dest/e.txt"]
    end

  end

end
