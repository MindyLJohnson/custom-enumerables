module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for item in self
      yield item
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    for index in 0.. self.size - 1
      yield self[index], index
    end
  end

  def my_select(&block)
    return to_enum(:my_select) unless block_given?

    arr = []
    self.my_each { |item| arr << item if block.call(item) }
    arr
  end

  def my_all?(&block)
    return to_enum(:my_all?) unless block_given?

    arr = []
    self.my_each { |item| arr << item if block.call(item) }
    arr == self
  end

  def my_none?(&block)
    return to_enum(:my_all?) unless block_given?

    arr = []
    self.my_each { |item| arr << item if block.call(item) }
    arr.length == 0
  end

  def my_count(obj=nil, &block)
    return self.length if !block_given? && obj.nil?

    arr = []
    self.my_each { |item| arr << item if item == obj } unless obj.nil?
    self.my_each { |item| arr << item if block.call(item) } if block_given?
    arr.length
  end
end