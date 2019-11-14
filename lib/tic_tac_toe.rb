require 'pry'

WIN_COMBINATIONS = [
  [0, 1, 2], # Top row 
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 4, 8], # Top left diagonal
  [2, 4, 6], # Top right diagonal 
  [0, 3, 6], # Left vertical 
  [1, 4, 7], # Middle vertical 
  [2, 5, 8] # Right vertical
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "    
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end 

def move(board, index, token)
  board[index] = token 
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
     return true
  else 
    return false
  end
end

def valid_move?(board, index) 
  if index.between?(0, 8) && !position_taken?(board, index) 
    return true 
  end 
end 
  
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Invalid Move"
    turn(board)
  end
end
  
def turn_count(board) 
  counter = 0 
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      puts "#{counter}"
    end
  end
  counter
end

def current_player(board)
  # binding.pry 
  if turn_count(board) % 2 == 0 
    return "X" 
  else 
    return "O"
  end
end
  
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") || 
       (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
      return win_combo.to_ary
    end
  end
end 

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end 

def draw?(board) 
  if !won?(board) && full?(board) 
    return true 
  else 
    return false 
  end 
end 

def over?(board) 
  if won?(board) || draw?(board) || full?(board) 
    return true 
  end 
end 

def winner(board) 
  winning_combo = won?(board) 
  if winning_combo 
    return board[winning_combo[0]]
  end
end 

def play(board)
  until over?(board)  
    turn(board) 
  end
  if won?(board) 
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
end 










  
  
  
  
  
  
  
  
  
  
