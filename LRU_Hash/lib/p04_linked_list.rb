class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev unless @next.nil?
    @prev.next = @next unless @prev.nil?
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    
    @head.next = @tail
    @tail.prev = @head
    
    @count = 0
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    self.each {|node| return node if node.key == key}
  end

  def include?(key)
    
  end

  def append(key, val)
    prev_node = @tail.prev
    new_node = Node.new(key, val)
    
    prev_node.next = new_node
    @tail.prev = new_node
    new_node.prev = prev_node
    new_node.next = @tail
  end

  def update(key, val)
    node = @head
    until node.key.nil? || node.key == key
      node = node.next
    end
    p node
    
    return "didnt find" if node.key.nil?
    node.val = val
  end

  def remove(key)
  end

  def each(&prc)
    iter_node = @head
    
    @count.times do |n|   
      iter_node = iter_node.next 
      prc.call(iter_node)
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
