module Enumerable

  # my_each

  def my_each
    for key, value in self
      yield key, value
    end
    return self
  end

  # my_each_with_index

  def my_each_with_index
    counter = 0
    for value in self
      yield value, counter
      counter += 1
    end
  end

  # my_select
  
  def my_select(&block)
    array =[]
    hash = {}
    case self
    when Array
      self.my_each do |value|
        if block.call(value)
          array.push(value)
        end
      end
      return array
    when Hash
      self.my_each do |key, value|
        if block.call(key, value)
          hash[key] = value
        end
      end
      return hash
    end
  end

  # my_all?

  def my_all?(&block)
    self.my_each do |value|
      if block.call(value) == false
        return false
      end
    end
    return true
  end

  # my_any?

  def my_any?(&block)
    self.my_each do |value|
      if block.call(value)
        return true
      end
    end
    return false
  end

  # my_none?

  def my_none?(argv=nil, &block)
    block = Proc.new { |item| item unless item.nil? || !item } unless block_given?
    block = Proc.new { |item| item if argv === item} unless argv.nil?
    self.my_each do |value|
      if block.call(value)
        return false
      end
    end
    return true
  end

  # my_count

  def my_count(argv=nil, &block)
    block = Proc.new { |item| item unless item.nil? || !item } unless block_given?
    block = Proc.new { |item| item if argv === item} unless argv.nil?
    count = 0
    self.my_each do |item|
      if block.call(item)
        count += 1
      end
    end
    count
  end

  # my_map

  def my_map(a_proc=nil)

    map_array = []
    if a_proc
      for item in self
        map_array.push(a_proc.call(item))
      end
      return map_array
    end
    for item in self
      map_array.push(yield item)
    end
    return map_array

  end

  # my_inject

  def my_inject(accumulator=nil, &block)
    
    self.class == Range ? arr = self.to_a : arr = self

    if block_given?
      for item in arr
        if accumulator.nil?
          accumulator = self.first
          next
        end
        accumulator = block.call(accumulator, item)
      end
    else
      for item in arr
        if accumulator.nil?
          accumulator = self.first
          next
        end
        accumulator = yield accumulator, item
      end
    end
    accumulator
  end

end

def multiply_els arr
  arr.my_inject(&:*)
end