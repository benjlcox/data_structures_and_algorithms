# Contigious (circular) array implementation
# has a hard capacity but negates any need to resize array
require 'pry'

class QueueArray

  def initialize(capacity)
    @capacity = capacity
    @count = 0
    @front = 0
    @queue = []
  end

  def next_index
    (@front + @count) % @capacity
  end

  def enter(e)
    if @count == @capacity
      return false
    else
      @queue[next_index] = e
      @count += 1
      return e
    end
  end

  def leave
    if empty?
      return false
    else
      value = @queue[@front]
      @queue[@front] = nil
      @front = (@front + 1) > @capacity - 1  ? 0 : @front + 1
      @count -= 1
      return value
    end
  end

  def empty?
    @count == 0
  end

  def front
    @queue[@front]
  end

  def rear
    @queue[(@front + @count - 1) % @capacity]
  end

end

# Linked list implementation
# Efficient without a capacity limit but not contigious in memory
class QueueList

  Node = Struct.new(:value, :right)

  def initialize
    @front = nil
    @rear = nil
    @count = 0
  end

  def enter(e)
    new_node = Node.new(e, nil)
    if @front
      @rear.right = new_node
      @rear = new_node
    else
      @front = @rear = new_node
    end
    @count += 1
    @rear.value
  end

  def leave
    return nil unless @front
    old_node = @front
    @front = old_node.right
    @count -= 1
    old_node.value
  end

  def front
    @front.value
  end

  def rear
    @rear.value
  end

  def empty?
    @count == 0
  end

  def size
    @count
  end
end

binding.pry
