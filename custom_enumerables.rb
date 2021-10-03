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

  def my_none?(pattern=nil, &block)
    block = Proc.new { |item| item if item } unless block_given?
    block = Proc.new { |item| item if pattern === item } unless pattern.nil?
    self.my_each { |item| return true unless block.call(item) }
    false
  end

  def my_count(obj=nil, &block)
    return self.length if !block_given? && obj.nil?

    count = 0
    self.my_each { |item| count += 1 if block.call(item) } if block_given?
    self.my_each { |item| count += 1 if item == obj } unless obj.nil?
    count
  end

  def my_map(obj=nil, &block)
    return to_enum(:my_map) unless block_given?

    arr = []
    self.my_each { |item| arr << block.call(item) }
    arr
  end

  def my_inject(*args, &block)
    acc, sym = *args if args.length > 1 || block_given?
    sym = args[0] if args.length == 1 && !block_given?

    self.my_each do |item|
      acc = block.call(acc, item) unless acc.nil?
      acc = self.first if acc.nil?
    end if block_given?

    self.my_each do |item|
      acc = item.send(sym, acc) unless acc.nil?
      acc = self.first if acc.nil?
    end unless block_given?

    acc
  end
end