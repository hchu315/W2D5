require "byebug"

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    if include?(key)
      'value is already in array'
    else 
      @store[key.hash % num_buckets] << key
      @count += 1
    end
  end

  def include?(key)
      @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    unless include?(key)
      puts 'value is not in array'
    else
      @store[key.hash % num_buckets].delete(key)
      @count -= 1
    end  
  end
  
  def resize!
    els = []
    @store.each { |arr| arr.each { |el| els << el} }    
    @store = Array.new(num_buckets * 2) { Array.new }
    els.each { |el| @store[el.hash % num_buckets] << el}
  end
  
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  # def resize!
  #   els = []
  #   @store.each { |arr| arr.each { |el| els << el} }    
  #   @store = Array.new(num_buckets * 2) { Array.new }
  #   els.each { |el| insert(el)}
  # end
end

a = HashSet.new

(0..8).each {|n| a.insert(n)}
p a.store


