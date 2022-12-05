require 'debug'

# input_file = File.open("day4/basic_input.txt")
input_file = File.open("day4/input.txt")

file_data = input_file.readlines.map(&:chomp)

def numbers_present(given_range)
  numbers = []
  low, high = given_range.split('-')
  low.upto(high) { |i| numbers << i } 
  numbers
end

def numbers_overlap(one_numbers, two_numbers)
  one_numbers.each do |num|
    return true if two_numbers.include?(num)
  end
  false
end

total = 0

file_data.each do |line|
  one, two = line.split(",")
  one_numbers = numbers_present(one)
  two_numbers = numbers_present(two)
  total += 1 if numbers_overlap(one_numbers, two_numbers)
end

puts total
