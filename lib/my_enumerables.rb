module Enumerable
  # Your code goes here

  def my_select
    result = []
    self.my_each do |item|
      result << item if yield(item)
    end
    result
  end

  def my_none?(arg = nil)
    if block_given?
      self.my_each do |item|
        return false if yield(item)
      end
    else
      self.my_each do |item|
        return false if item
      end
    end
    true
  end

  def my_map
    result = []
    self.my_each do |item|
      result << yield(item)
    end
    result
  end

  def my_inject(arg = nil)
    if block_given?
      if arg.nil?
        result = self[0]
        self[1..-1].my_each do |item|
          result = yield(result, item)
        end
      else
        result = arg
        self.my_each do |item|
          result = yield(result, item)
        end
      end
    else
      if arg.nil?
        result = self[0]
        self[1..-1].my_each do |item|
          result = result.send(:*, item)
        end
      else
        result = arg
        self.my_each do |item|
          result = result.send(:*, item)
        end
      end
    end
    result
  end

  def my_count(arg = nil)
    if block_given?
      count = 0
      self.my_each do |item|
        count += 1 if yield(item)
      end
      count
    elsif arg.nil?
      length
    else
      count = 0
      self.my_each do |item|
        count += 1 if item == arg
      end
      count
    end
  end

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
  def my_each
    for i in self
      yield(i)
    end
    self
  end
  # Define my_each here
end
