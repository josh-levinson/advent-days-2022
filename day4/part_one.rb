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

def contains_other(one_numbers, two_numbers)
  return true if one_numbers == two_numbers
  # if theyre not equal and same length no way contain each other
  return false if one_numbers.length == two_numbers.length

  return_value = true
  if one_numbers.length > two_numbers.length
    two_numbers.each do |two_num|
      return_value = false unless one_numbers.include?(two_num)
    end
  else
    one_numbers.each do |one_num|
      return_value = false unless two_numbers.include?(one_num)
    end
  end
  return_value
end

total = 0

file_data.each do |line|
  one, two = line.split(",")
  one_numbers = numbers_present(one)
  two_numbers = numbers_present(two)
  total = total + 1 if contains_other(one_numbers, two_numbers)
end

puts total
