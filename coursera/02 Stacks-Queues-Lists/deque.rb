# Dequeue. A double-ended queue or deque (pronounced "deck") is a generalization of a stack and a queue that supports inserting and removing items from either the front or the back of the data structure. Create a generic data type Deque that implements the following API:
#
# public class Deque<Item> implements Iterable<Item> {
#   public Deque()                           // construct an empty deque
#   public boolean isEmpty()                 // is the deque empty?
#   public int size()                        // return the number of items on the deque
#   public void addFirst(Item item)          // insert the item at the front
#   public void addLast(Item item)           // insert the item at the end
#   public Item removeFirst()                // delete and return the item at the front
#   public Item removeLast()                 // delete and return the item at the end
#   public Iterator<Item> iterator()         // return an iterator over items in order from front to end
#   public static void main(String[] args)   // unit testing
# }

class Deque

  Node = Struct.new(:left, :right, :obj)

  def initialize(ary = [])
    @front = nil
    @back = nil
    @size = 0
    ary.to_a.each do |obj|
      add_last(obj)
    end
  end

  def empty?
    @size == 0
  end

  def size
    @size
  end

  def first
    @front
  end

  def last
    @back
  end

  def add_first(obj)
    if !@front.nil?
      node = Node.new(nil, @front, obj)
      @front.left = node
      @front = node
    else
      @front = @back = Node.new(nil, nil, obj)
    end
    @size += 1
    @front
  end

  def add_last(obj)
    if !@back.nil?
      node = Node.new(@back, nil, obj)
      @back.right = node
      @back = node
    else
      @front = @back = Node.new(nil, nil, obj)
    end
    @size += 1
    @back
  end

  def remove_first
    unless @front.nil?
      node = @front.right
      @front = node
      @front.left = nil
      @front
    end
  end

  def remove_last
    unless @back.nil?
      node = @back.left
      @back = node
      @back.right = nil
      @back
    end
  end

  def list
    return unless @front
    msg = ""
    node = @front
    while node != nil
      msg << "#{node.obj}"
      node = node.right
      msg << " -> " unless node.nil?
    end
    msg
  end

  def list_reverse
    return unless @back
    msg = ""
    node = @back
    while node != nil
      msg << "#{node.obj}"
      node = node.left
      msg << " -> " unless node.nil?
    end
    msg
  end
end
