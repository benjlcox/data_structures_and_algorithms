#Doubly linked list implementation
class LinkStack

  Node = Struct.new(:item, :left, :right)

  def initialize
    @topNode = nil
    @size = 0
  end

  def push(e)
    newNode = Node.new(e,nil,@topNode)
    @size += 1
    @topNode.left = newNode unless @topNode.nil?
    @topNode = newNode
  end

  def pop
    oldNode = @topNode
    @topNode = @topNode.right
    @size -= 1
    @topNode.left = nil unless @topNode.nil?
    oldNode
  end

  def top
    @topNode
  end

  def empty?
    @topNode.nil?
  end

  def size
    @size
  end
end

#Array implementation

class ArrStack

  def initialize
    @store = Array.new
    @size = 0
  end

  def push(e)
    @store[@size] = e
    @size += 1
    e
  end

  def pop
    last = @store[@size - 1]
    @store.pop
    @size -= 1
    last
  end

  def top
    if @size == 0
      nil
    else
      @store[@size - 1]
    end
  end

  def empty?
    @size == 0
  end

  def size
    @size
  end

end
