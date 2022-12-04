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

file_data = input_file.readlines.map(&:chomp)

score = 0

file_data.each do |line|
  line_values = line.split(' ')
  opponent = encrypted_opponent_values[line_values[0]] 
  player = encrypted_player_values[line_values[1]]

  game_result = rock_paper_scissors[opponent][player]
  
  score = score + game_result_value(result: game_result)
  score = score + play_values[player]
end

puts score
