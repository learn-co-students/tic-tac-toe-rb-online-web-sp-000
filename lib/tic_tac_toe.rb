board = [" "," "," "," "," "," "," "," "," "]
       
WIN_COMBINATIONS = [ 
[0,1,2], # top_row 
[3,4,5], # middle_row 
[6,7,8], # bottom_row 
[0,3,6], # left_column 
[1,4,7], # center_column 
[2,5,8], # right_column 
[0,4,8], # left_diagonal 
[6,4,2] # right_diagonal 
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

  def move(board, user_input, player)
  board[user_input] = player
end

def position_taken?(board, index)
  board[index]== "X" || board[index] == "O"
end

def valid_move?(board,index)
index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  counter = 0
  board.each {|space|
    if space == "X" || space == "O"
      counter += 1   
    end
  }
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
if valid_move?(board,index)
  move(board,index, current_player(board)) 
 else 
   turn(board)
 end
  display_board(board)
end
 
 def won?(board)
  WIN_COMBINATIONS.each do |single_win_combo|
    win_index_1 = single_win_combo[0]
    win_index_2 = single_win_combo[1]
    win_index_3 = single_win_combo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
   
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return single_win_combo
    end
  end
  return false
end

def full?(board)
  if board.any? {|index| index == nil || index == " "}
    return false
  else
    return true
  end
end

def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif!full?(board) && !won?(board)
     return false
   else won?(board)
     return false
   end
end


def over?(board)
  if draw?(board) || won?(board) || full?(board) 
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end


 def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end