#Social network connectivity. Given a social network containing N members and a log file containing M timestamps at which times pairs of members formed friendships, design an algorithm to determine the earliest time at which all members are connected (i.e., every member is a friend of a friend of a friend ... of a friend). Assume that the log file is sorted by timestamp and that friendship is an equivalence relation. The running time of your algorithm should be MlogN or better and use extra space proportional to N.


# Strategy -> Use a weighted quick find that tracks the size of each branch. Return when the branch size equals the number of members (meaning all members are connected to one another)
class SocialNetwork

  def initialize
    @log = [[1403361323795, 0, 1],
    [1403361323797, 1, 2],
    [1403361323798, 2, 3],
    [1403361323799, 3, 0],
    [1403361323801, 1, 3],
    [1403361323802, 2, 0],
    [1403361323803, 4, 1], #this should be the answer
    [1403361323804, 4, 2],
    [1403361323806, 4, 3],
    [1403361323807, 4, 0]]

    @tree = [*0..4]
    @size = Array.new(@tree.length, 1)
  end

  def all_connected?(size)
    size == @tree.length
  end

  def root(a)
    while a != @tree[a]
      @tree[a] = @tree[@tree[a]] #branch compression
      a = @tree[a]
    end
    return a
  end

  def union(a,b)
    rootA = root(a)
    rootB = root(b)

    unless rootA == rootB
      if @size[rootA] < @size[rootB]
        @tree[rootA] = rootB
        @size[rootB] += @size[rootA]
        if all_connected?(@size[rootB])
          return true
        end
      else
        @tree[rootB] = rootA
        @size[rootA] += @size[rootB]
        if all_connected?(@size[rootA])
          return true
        end
      end
    end
  end

  def exec
    @log.each_with_index do |entry|
      if union(entry[1], entry[2])
        return entry[0]
      end
    end
  end
end

