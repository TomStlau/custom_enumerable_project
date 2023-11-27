module Enumerable
  # Your code goes here

  def my_select
    result = []
    my_each  { |item| result << item if yield(item) }
    result
  end

  def my_none?
    if block_given?
      my_each { |item| return false if yield(item) }
    else
      my_each { |item| return false if item }
    end
    true
  end

  def my_map
    result = []
    my_each { |item| result << yield(item) }
    result
  end

  def my_inject(arg = nil)
    result = arg || self[0]
    array = arg ? self : self[1..-1]

    array.my_each { |item|
      result = if block_given?
                 yield(result, item)
               else
                 result.send(:*, item)
               end
    }
    result
  end

  def my_count(arg = nil)
    if block_given?
      count = 0
      my_each { |item| count += 1 if yield(item) }
      count
    elsif arg.nil?
      length
    else
      count = 0
      my_each { |item| count += 1 if item == arg }
      count
    end
  end

  def my_each_with_index
    length.times { |index| yield(self[index], index) }
    self
  end

  def my_any?
    if block_given?
      my_each { |item| return true if yield(item) }
        else
      my_each { |item| return true if item }
    end
    false
  end



  def my_all?
    if block_given?
      my_each { |item| return false unless yield(item) }
    else
      my_each { |item| return false unless item }
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
