require 'net/http'

uri = URI('https://github.com')

response = nil                  # to declare an outer scoping

Net::HTTP.start(uri.host, uri.port,
                :use_ssl => (uri.scheme == 'https')) do |http|
  request = Net::HTTP::Get.new uri

  response = http.request request # Net::HTTPResponse object
end

puts response


