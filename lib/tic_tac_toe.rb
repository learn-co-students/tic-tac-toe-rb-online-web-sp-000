WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]] 

board = [" "," "," "," "," "," "," "," "," "]

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

def move(board, index, character)
  board[index] = character
end 

def position_taken?(board, index)
  if (board[index] == " " or board[index] == "" or board[index] == nil) 
    return false
  else 
    return true 
end 

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  turn = 0
  board.each do |index|
    if index == "X" or index == "O"
      turn += 1 
    end 
  end
  return turn 
end 

def current_player(board)
  turn_number = turn_count(board)
  if turn_number % 2 == 0  
    return "X"
  else 
    return "O"
  end 
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(index, player_token)
    display_board(board)
  else 
    turn(board)
  end 
end 


def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end    
  }
  return false 
end 

def full?(board)
  board.all? {|index| index == "X" or index == "O"}
end 

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else 
    return false
  end 
end 

def over?(board)
  if won?(board) or draw?(board) or full?(board)
    return true 
  else 
    return false 
  end 
end 

def winner(board)
  if won?(board)
    return board[won?(board)[1]]
  end 
end
 
def play(board)
  until over?
    turn
  end 
  if won? 
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "It's a draw!"
  end 
end 
end