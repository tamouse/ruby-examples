def walk_tree(h, out=Array())
  h.each do |k,v|
    if v.is_a? Hash
      walk_tree(v, out)
    else
      out << v
    end
  end
  out
end
