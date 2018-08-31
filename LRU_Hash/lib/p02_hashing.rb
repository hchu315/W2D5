class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    new_hash = 0
    self.each_with_index {|el, idx| new_hash += (el.hash * idx.hash) }
    new_hash
  end
end

class String
  def hash
    new_hash = 0
    self.each_char.with_index {|el, idx| new_hash += (el.ord.hash * idx.hash) }
    new_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_hash = 0
    self.each_with_index {|k, v| new_hash += (k.to_s.ord.hash * v.ord.hash) }
    new_hash  
  end
end
