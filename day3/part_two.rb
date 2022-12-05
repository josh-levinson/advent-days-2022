require 'debug'

# input_file = File.open("day3/basic_input.txt")
input_file = File.open("day3/full_input.txt")

file_data = input_file.readlines.map(&:chomp)

def split_into_thirds(lines)
  output = {}
  lines.each_with_index do |line, index|
    split_index = index / 3
    output[split_index] = [] unless output[split_index]
    output[split_index] << line
  end
  output
end

def priority_value(char)
  char.downcase == char ? char.ord - 96 : char.ord - 38
end

groups = split_into_thirds(file_data)

priority = 0

groups.each do |group|
  one, two, three = group[1]
  present_in_first_two = one.chars.select{|char| two.include?(char)}
  match = present_in_first_two.select{|char| three.include?(char)}
  priority = priority + priority_value(match[0])
end

puts priority
