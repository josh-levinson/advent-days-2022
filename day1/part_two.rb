require 'debug'

input_file = File.open("input.txt")

file_data = input_file.readlines.map(&:chomp)

elf_data = {}
elf_index = 0
elf_data[0] = 0

file_data.each do |line|
  if line == ""
    elf_index = elf_index + 1
    elf_data[elf_index] = 0
  else
    elf_data[elf_index] = elf_data[elf_index] + line.to_i
  end
end

highest_three_values = elf_data.values.max(3)

puts highest_three_values.sum
