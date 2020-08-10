require "pry"
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board = [" "," "," "," "," "," "," "," "," "] )
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(string)
  string.to_i - 1
end

def move(board,position,character)
  board[position] = character
end

def position_taken?(board,index)
board[index] == "X" || board[index] == "O"
end

def valid_move?(board,index)
  if board[index] == " " && index >= 0 && index <= 8
    return true
  else
    false
end
end

def turn_count(board)
  counter = 0
  board.each do |move|
    if move == "X" || move == "O"
    counter += 1
  end 
end
return counter
end

def current_player(board)
 move = turn_count(board)
  if move % 2 == 0
    return "X"
  else
  return "O"
end 
end

def turn(board)
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board) 
 WIN_COMBINATIONS.find do |win_combination|
  board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
 end
end

def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
 if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
   return "X"
 elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
 return "O"
end
end
return nil
end

def play(board)
  until over?(board)
  turn(board)
  end
  winner(board) == "X"
    puts "Congratulations X!"
    winner(board) == "O"
    puts "Congratulations O!"
    draw?(board)
    puts "Cat's Game!"
end

