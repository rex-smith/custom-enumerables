module Enumerable

  # my_each

  def my_each
    for key, value in self
      yield key, value # Needs to yield to the block given to it
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

  # my_select (can use #my_each)
  # NEED TO FIGURE OUT WHY THE AMPERSAND IS USED TO MAKE THE BLOCK A PROC BELOW
  # THOUGHT WE COULD USE YIELD
  
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

  # Need to look through each one in the set and select the ones that fit a criteria
  # Need to pass a block to select that checks if true or false and builds and returns an 
  # array with all of the true ones

  # my_all?

  # my_any?

  # my_none?

  # my_count

  # my_map

  # my_inject





end
