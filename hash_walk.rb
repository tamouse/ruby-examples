
# An attempt to build a method that will deep walk a hash in order to
# convert it to something else, possibly an ostruct


class Hash
  def walk(&b)
    each do |k,v|
      case v
      when Hash
        yield k,v.walk(&b)
      when Array
        vv = v.map do |i|
          case i
          when Hash
            i.walk(&b)
          else
            i
          end
        end
        yield k,vv
      else
        yield k,v
      end
    end
  end
end

require 'ostruct'
class OpenStruct
  def self.deep_convert_hash(h)
    o = OpenStruct.new()
    h.each do |k,v|
      o[k] = case v
             when Hash
               deep_convert_hash(v)
             when Array
               v.map {|i| i.kind_of?(Hash) ? deep_convert_hash(i) : i}
             else
               v
             end
    end
    o
  end
end

        
    
