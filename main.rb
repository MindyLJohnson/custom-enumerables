require_relative 'custom_enumerables'

puts ">>my_each vs. each"
numbers = [2, 4, 6, 8, 10]
puts "\nmy_each"
numbers.my_each  { |item| puts item }
puts "\neach"
numbers.each  { |item| puts item }

puts "\n>>my_each_with_index vs. each_with_index"
numbers = [2, 4, 6, 8, 10]
puts "\nmy_each_with_index"
numbers.my_each_with_index  { |item, index| puts "#{item}, #{index}" }
puts "\neach_with_index"
numbers.each_with_index  { |item, index| puts "#{item}, #{index}" }

puts "\n>>my_select vs. select"
numbers = [1, 2, 3, 4, 5]
puts "\nmy_select"
puts numbers.my_select  { |item| item.even? }
puts "\nselect"
puts numbers.select  { |item| item.even? }

puts "\n>>my_all? vs. all?"
numbers = [2, 4, 6, 8, 10]
puts "\nmy_all?"
puts numbers.my_all?  { |item| item.even? }
puts numbers.my_all?(Integer)
puts numbers.my_all?
puts "\nall?"
puts numbers.all?  { |item| item.even? }
puts numbers.all?(Integer)
puts numbers.all?

puts "\n>>my_none? vs. none?"
numbers = [1, 3, 5, 7, 9]
puts "\nmy_none?"
puts numbers.my_none?  { |item| item.even? }
puts numbers.my_none?(String)
puts numbers.my_none?
puts "\nnone?"
puts numbers.none?  { |item| item.even? }
puts numbers.none?(String)
puts numbers.none?

puts "\n>>my_count vs. count"
numbers = [1, 2, 2, 4, 5]
puts "\nmy_count"
puts numbers.my_count  { |item| item.even? }
puts numbers.my_count(2)
puts numbers.my_count
puts "\ncount"
puts numbers.count  { |item| item.even? }
puts numbers.count(2)
puts numbers.count

puts "\n>>my_map vs. map"
numbers = [1, 2, 2, 4, 5]
puts "\nmy_map"
puts numbers.my_map  { |item| item.even? }
puts "\nmap"
puts numbers.map  { |item| item.even? }

puts "\n>>my_inject vs. inject"
numbers = [1, 2, 2, 4, 5]
puts "\nmy_inject"
puts numbers.my_inject  { |sum, item| sum + item }
puts numbers.my_inject(10)  { |sum, item| sum + item }
puts numbers.my_inject(:+)
puts numbers.my_inject(10, :+)
puts "\ninject"
puts numbers.inject  { |sum, item| sum + item }
puts numbers.inject(10)  { |sum, item| sum + item }
puts numbers.inject(:+)
puts numbers.inject(10, :+)
