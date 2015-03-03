require 'benchmark/ips'

TEST_ARRAY = [].tap{|a| 100.times { a << "Lorem ipsum Esse sit esse enim reprehenderit cupidatat dolore consectetur qui ut cupidatat proident in."}}

Benchmark.ips do |x|
  x.report("regexp in loop") do
    TEST_ARRAY.map do |el|
      %r{\A.*(Esse).*\z}.match(el)
    end
    TEST_ARRAY.map do |el|
      %r{\A.*(Esse).*\z}.match(el)
    end
  end
  x.report("regexp before loop") do
    re = %r{\A.*(Esse).*\z}
    TEST_ARRAY.map do |el|
      re.match(el)
    end
    TEST_ARRAY.map do |el|
      re.match(el)
    end
  end
  x.compare!
end
