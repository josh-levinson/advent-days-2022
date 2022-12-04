require 'debug'

encrypted_opponent_values = {'A' => 'rock', 'B' => 'paper', 'C' => 'scissors'}
encrypted_player_values =   {'X' => 'rock', 'Y' => 'paper', 'Z' => 'scissors'}

play_values = { 'rock' => 1, 'paper' => 2, 'scissors' => 3 }

rock_paper_scissors = { 'rock' =>     { 'rock' => 'draw', 'paper' => 'lose',  'scissors' => 'win' },
                        'paper' =>    { 'rock' => 'win',  'paper' => 'draw',  'scissors' => 'lose' },
                        'scissors' => { 'rock' => 'lose', 'paper' => 'win',   'scissors' => 'draw' }
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
  player = encrypted_player_values[player_choice]

  game_result = rock_paper_scissors[player][opponent]
  
  score = score + game_result_value(result: game_result)
  score = score + play_values[player]
end

puts score
