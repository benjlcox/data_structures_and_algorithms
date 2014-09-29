class Node
  attr_accessor :node, :next

  def initialize(node)
    @node = node
  end

  def self.list(node, list = nil)
    list ||= ""
    return list if node.nil?
    traverse(node.next, list << "#{node.node} -> ")
  end

end
