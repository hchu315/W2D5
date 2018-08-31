class MaxIntSet #TC: Insert: O(1), include O(1), delete O(1)
  def initialize(max)
    @max = max
    @store = Array.new(max) {false} 
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true unless include?(num)
  end

  def remove(num)
    raise "Out of bounds" unless is_valid?(num)
    unless @store[num]
      puts 'value is not in array'
    else
      @store[num] = false
      num
    end    
  end

  def include?(num)
    raise "DON'T DO THAT" unless is_valid?(num)
    @store[num]
  end
  
  def display
    @store
  end

  private

  def is_valid?(num)
    (0..@max).include?(num)
  end

  def validate!(num)
  end
end


class IntSet #TC: Insert: O(n), include O(n), delete O(n)
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    include?(num) ? 'value is already in array' : @store[num % num_buckets] << num
  end

  def remove(num)
    unless include?(num)
      puts 'value is not in array'
    else
      @store[num % num_buckets].delete(num)
    end  
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet #TC (WC): Insert: O(n), include O(n), delete O(n), #TC (AMT): Insert: O(1), include O(1), delete O(1)
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= num_buckets
    if include?(num)
      'value is already in array'
    else 
      @store[num % num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    unless include?(num)
      puts 'value is not in array'
    else
      @store[num % num_buckets].delete(num)
      @count -= 1
    end  
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    els = []
    @store.each { |arr| arr.each { |el| els << el} }    
    @store = Array.new(num_buckets * 2) { Array.new }
    els.each { |el| @store[el % num_buckets] << el }
  end
end
