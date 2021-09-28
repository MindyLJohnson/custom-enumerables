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
end