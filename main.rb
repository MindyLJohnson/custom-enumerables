require_relative 'custom_enumerables'

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]

puts "\nmy_each"
numbers.my_each  { |item| puts item }

puts "\neach"
numbers.each  { |item| puts item }