require 'pry'

WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
  
  # if board[index] == " " || board[index] == "" || board[index] == nil
  #   return false
  # elsif board[index] == "X" || "O"
  #   return true
  # end
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index) 
  
  # position_taken?(board, index) || index.between?(0, 8) == false
  #   return false
  # else 
  #   position_taken?(board, index) == false
  #   return true
  # end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else turn_count(board) % 2 == 1 
    return "O"
  end
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

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && 
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|pipes| pipes == "X" || pipes == "O"}
end

def draw?(board)
  if won?(board) == nil && full?(board) == true 
    return true
  elsif won?(board) == true 
    return false
  end
end

def over?(board)
  won?(board) || full?(board) 
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]] 
  end
end

def play(board)
  until over?(board) || draw?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end