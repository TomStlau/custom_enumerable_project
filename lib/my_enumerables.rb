module Enumerable
  # Your code goes here

  def my_each_with_index
    length.times do |index|
      yield(self[index], index)
    end
    self
  end

  def my_any?(arg = nil)
    if block_given?
      self.my_each do |item|
        return true if yield(item)
      end
    else
      self.my_each do |item|
        return true if item
      end
    end
    false
  end

  def my_each
    for i in self
      yield(i)
    end
    self
  end

  def my_all?(arg = nil)
    if block_given?
      self.my_each do |item|
        return false unless yield(item)
      end
    else
      self.my_each do |item|
        return false unless item
      end
    end
    true

  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
