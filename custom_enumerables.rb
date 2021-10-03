module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for obj in self
      yield obj
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

  def my_all?(pattern=nil, &block)
    block = Proc.new { |item| item if item } unless block_given?
    block = Proc.new { |item| item if pattern === item } unless pattern.nil?
    self.my_each { |item| return false unless block.call(item) }
    true
  end

  def my_none?(&block)
    return to_enum(:my_all?) unless block_given?

    arr = []
    self.my_each { |item| arr << item if block.call(item) }
    arr.length == 0
  end

  def my_count(obj=nil, &block)
    return self.length if !block_given? && obj.nil?

    count = 0
    self.my_each { |item| count += 1 if block.call(item) } if block_given?
    self.my_each { |item| count += 1 if item == obj } unless obj.nil?
    count
  end
end