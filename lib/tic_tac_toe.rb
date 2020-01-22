WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end  

def move(board, index, token)
  board[index] = token
  return board
end  

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
 index.between?(0, 8) && !(position_taken?(board, index))
end

def turn(board)
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   token = current_player(board)
   if valid_move?(board, index)
      move(board, index, token)
     display_board(board) 
   else
      turn(board)
   end  
end

def turn_count(board)
  num_of_turns = 0 
  board.each do |positions|
    if positions == "X" || positions == "O"
    num_of_turns += 1   
    end
  end
  return num_of_turns
end 

def current_player(board)
  num_of_turns = turn_count(board)
  if num_of_turns.even?
    return "X"
  else
    return "O"
  end
end  

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
      return win_combo
    elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O"
      return win_combo
   end
  end
  false
end   

def full?(board)
  board.all? do |index| index == "X" || index == "O"
  end 
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
  else 
    return false 
  end
end

def winner(board)
  index = won?(board)
  if index == false
    return nil
  elsif (board[index[0]]) == "X"
    return "X"
  else
    return "O"
  end
end  
    
    
def play(board)
  until over?(board) == true 
   turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat\'s Game!"
  end  
end 

  