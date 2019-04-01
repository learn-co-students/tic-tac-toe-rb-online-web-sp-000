WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  
# Helper Methods
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

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true 
  else 
    return false 
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

def turn_count(board)
  count = 0
  board.each do |value|
   if value == "X" || value == "O"
     count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 != 0
    return "O"
  else
    return "X"
  end
end


def won?(board)
    
  winner_X_count = 0 
  winner_O_count = 0 
  
  WIN_COMBINATIONS.each do |combo| 
  win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]

  pos_1 = board[win_index_1]
  pos_2 = board[win_index_2]
  pos_3 = board[win_index_3]
  
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") 
      winner_X_count += 1
      return combo
    elsif (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      winner_O_count += 1
      return combo
    else
      false 
    end #end if
  end #end do
 
#return false if empty board 
 board.none? do |value|
   value == " "
 end 
 
 if winner_O_count == winner_X_count 
   false 
  end 
 
end


def full?(board)
  board.all? do |value|
    value != " "
  end

end

def draw?(board)
  if full?(board) && !won?(board)
    true 
  else
    false
  end
  
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true 
  elsif !full?(board)
    false 
  else 
    false
  end
  
end

def winner(board)
  result = won?(board)
  if result != false 
    return board[result[0]]
  else
    return nil 
  end 
end 

def play(board) 
  turn(board) until over?(board)
   
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else 
    puts "Cat's Game!"
  end 
      
end


