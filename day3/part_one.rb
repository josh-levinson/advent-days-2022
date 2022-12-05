require 'debug'

# input_file = File.open("day3/basic_input.txt")
input_file = File.open("day3/full_input.txt")

file_data = input_file.readlines.map(&:chomp)

def halves(str)
  str.chars.each_slice(str.length / 2).map(&:join)
end

def priority_value(char)
  char.downcase == char ? char.ord - 96 : char.ord - 38
end

total_priority = 0

file_data.each do |line|
  sack_one, sack_two =  halves(line)
  repeat_letter = sack_one.chars.select{|char| sack_two.include?(char) }[0]
  total_priority = total_priority + priority_value(repeat_letter)
end

puts "Total priority: #{total_priority}"
