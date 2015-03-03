
require 'benchmark'
require 'fileutils'

FileUtils.rm_f "null.java"
FileUtils.touch "null.java"
FileUtils.rm_f "null.c"
File.write("null.c","int main(){}")

n = 10

commands = [
  "ruby /dev/null",
  "ruby --disable-gems /dev/null",
  "ruby --disable-gems -e 'puts \"hello world!\"' /dev/null",
  "python /dev/null",
  "python -s -S /dev/null",
#  "javac null.java",
  "gcc null.c"  
]

Benchmark.bmbm do |b|
  commands.each do |cmd|
    b.report(cmd) { n.times { %x{#{cmd}}}}
  end
end

puts "(For #{n} iterations each. null.java is an empty file (#{File.size("null.java")} bytes). null.c contains an empty main (#{File.size("null.c")} bytes).)"
