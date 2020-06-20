require "pry"

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]

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

def move(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
 index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
   move(board, index, value = current_player(board))
   display_board(board)
 else
     turn(board)
   end
 end

 def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
   counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
 end

 def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
    return win_combination
  elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    return win_combination
  end
 end
 false
end

def full?(board)
  board.each do |full|
    if full == " "
     return false
    end
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
    if draw?(board)
     true
   elsif !!won?(board)
     true
 end
end

def winner(board)
if won?(board)
  return board[won?(board)[0]]
else
  return nil
 end
end


def play(board)
  until over?(board)
    turn(board)
  end
    won?(board)
     puts "Congratulations #{winner(board)}!"
    draw?(board)
     puts "Cat's Game!"
end
