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