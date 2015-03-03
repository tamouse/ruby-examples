def add_children(nodes)
  nodes.map do |node|
    data = {
      id: "#{node.id}",
      text: "#{node.text}",
      class: "#{node.type}",
    }
    data[:children] = add_children(node.children) if node.children.any?
    data
  end
end
