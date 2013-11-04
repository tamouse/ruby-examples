
def wrap(s, tag, attr={}, &b)
  s = [s] unless s.is_a? Array
  attr = attr.empty? ? '' : " #{attr.map{|k,v| "#{k}='#{v}'"}.join(" ")}"
  out = "<#{tag}#{attr}>"
  out += s.inject("") {|m,o| m+="#{block_given? ? (yield o) : o}"}
  out += "</#{tag}>"
end

def format_table(data)
  wrap(data,"table",border: 1) do |row|
    wrap(row,"tr", valign: :center) do |cell|
      wrap(cell,"td", align: :right)
    end
  end
end

data=[[1,2,3,4],[5,6,7,8]]

puts format_table(data)
