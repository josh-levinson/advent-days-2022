require 'debug'

encrypted_opponent_values = {'A' => 'rock', 'B' => 'paper', 'C' => 'scissors'}
encrypted_player_values =   {'X' => 'lose', 'Y' => 'draw', 'Z' => 'win'}

play_values = { 'rock' => 1, 'paper' => 2, 'scissors' => 3 }

rock_paper_scissors = { 'rock' =>     { 'rock' => 'draw', 'paper' => 'win', 'scissors' => 'lose' },
                        'paper' =>    { 'rock' => 'lose', 'paper' => 'draw', 'scissors' => 'win' },
                        'scissors' => { 'rock' => 'win', 'paper' => 'lose',  'scissors' => 'draw' }
                      }

def game_result_value(result:)
  if result == 'lose'
    0
  elsif result == 'draw'
    3
  elsif result == 'win'
    6
  end
end

input_file = File.open('day2/input.txt')
# input_file = File.open('day2/basic_input.txt')

file_data = input_file.readlines.map(&:chomp)

score = 0

file_data.each do |line|
  line_values = line.split(' ')
  opponent_choice = line_values[0]
  player_choice = line_values[1]

  opponent = encrypted_opponent_values[opponent_choice] 
  desired_outcome = encrypted_player_values[player_choice]

  possible_choices = rock_paper_scissors[opponent]
  final_choice = possible_choices.select{|k,v| v == desired_outcome}
  
  score = score + game_result_value(result: desired_outcome)
  score = score + play_values[final_choice.keys.first]
end

puts score
