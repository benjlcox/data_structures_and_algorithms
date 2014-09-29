class UIstuff
  def initialize(n)
    #quick find data structure of an array containing an element the same as id
    @id = [*0..n-1]
  end

  def exec(items)
    ops = items.split(" ").collect{|i| i.split("-")}
    ops.each do |connections|
      union(connections[0].to_i, connections[1].to_i)
      puts "#{@id.join(", ")}"
    end
    puts "Result:"
    puts "#{@id.join(",").gsub(",", " ")}"
  end
end

#Give the id[] array that results from the following sequence of 6 union
#operations on a set of 10 items using the quick-find algorithm.
#2-4 8-2 8-1 5-0 9-7 0-7

class QuickFind < UIstuff

  def connected(p,q)
    @id[p] == @id[q]
  end

  def union(p,q)
    unless connected(p,q) #don't bother if already connected
      pid = @id[p] #store the value at p in case there's multiple that need changing
      @id.each_with_index do |element,index|
        if @id[index] == pid
          @id[index] = @id[q] #once arrived at a p, index in this case, assign the value of q
        end
      end
    end
  end
end

#Give the id[] array that results from the following sequence of 9 union
#operations on a set of 10 items using the weighted quick-union algorithm from lecture.

# 6-0 2-1 2-4 4-5 4-3 8-9 0-8 7-2 6-5

class WeightedQuickFind < UIstuff

  def initialize(n)
    super #extends init from parent
    @size = Array.new(n, 1)
  end

  def root(p)
    while p != @id[p] #a loop that travels up the tree until you hit p
      p = @id[p] #assign p to its parent and keep going
    end
    return p
  end

  def connected(p,q)
    root(p) == root(q)
  end

  def union(p,q)
    rootp = root(p) #always connect at the root
    rootq = root(q)

    if rootp == rootq
      return
    elsif @size[rootp] < @size[rootq]
      @id[rootp] = rootq #if p is smaller than q, attach p to q
      @size[rootq] += @size[rootp] #add sizes together, make sure bigger branch is getting the addition
    else
      @id[rootq] = rootp
      @size[rootp] += @size[rootq]
    end
  end
end
