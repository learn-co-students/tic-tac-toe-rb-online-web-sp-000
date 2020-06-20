require "pry"
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
counter = 0
board.each do |position|
  if position == ("X") || position == ("O")
counter += 1
 end
end
counter
end #returns the number of turns that have been played

def current_player(board)
  if turn_count(board) % 2 == 0
  return "X"
else
  return "O"
end
end

def won?(board)
    WIN_COMBINATIONS.detect do |index|
      board[index[0]] == board[index[1]] &&
      board[index[1]] == board[index[2]] &&
      position_taken?(board, index[0])
  end
end

def full?(board)
#binding.pry
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
 winning_combo = won?(board)
 return board[winning_combo[0]]
end
end

def play(board)
 until over?(board)
   turn(board)
 end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 else
   puts "Cat\'s Game!"
 end
end
