require_relative 'custom-enumerables'
require 'pry-byebug'


# COMPARE EACHES

arr = [1, 2, 3, 4]
arr_1 = [1, 'string', nil, 0.1]
hash = {:a=>1, :b=>2, :c=>3}

# my_each
puts "-------- #my_each vs #each --------"
arr.my_each { |item| puts item }
{'a' => 1, 'b' => 2}.my_each { |k, v| puts "#{k}, #{v}"}
puts ''

# built-in each
arr.each { |item| puts item }
{'a' => 1, 'b' => 2}.each { |k, v| puts "#{k}, #{v}"}
puts ''

# COMPARE EACH WITH INDEXES

puts "-------- #my_each_with_index vs #each_with_index --------"
arr.my_each_with_index { |item, index| puts "item: #{item}, index: #{index}" }
puts ''

arr.each_with_index { |item,index| puts "item: #{item}, index: #{index}"}
puts ''

# COMPARE SELECTS

puts "-------- #my_select vs #select --------"

p arr.my_select { |item| item.even?}
p arr.select { |item| item.even?}

p hash.my_select { |k,v| v>1}
p hash.select {|k,v| v>1}
puts ''