WIN_COMBINATIONS = [
  [0,1,2],  #first-row
  [3,4,5],  #second-row
  [6,7,8],  #third-row
  [0,3,6],  #first-colum
  [1,4,7],  #second-column
  [2,5,8],   #third-column
  [2,4,6],  #diangle-win
  [0,4,8],  #diangle-win
  ]
  
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  
  
  def input_to_index(user_input)
    index = user_input .to_i - 1
  end
  
  def move(board,index,symbol)
    board[index] = symbol
  end
 
#evaluates if the position is position_taken
 def position_taken?(board, index)
   if board[index] == " " || board[index] == "" || board[index] == nil
     return false  
   else
     return true 
   end
 end


def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board,index)
end
 

def turn_count(board)
  counter = 0 
  
  board.each do |moves|
    if moves == "X" || moves == "O"
      counter +=1 
    end 
  end 
  return counter
end
  
  
def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else
    return "Y"
  end
end 


def turn(board)
puts "Please select a number between 1-9:"
 user_input = gets.strip
 index = input_to_index(user_input)
  if !valid_move?(board,index)
    turn(board)
  else
    move(board,index, current_player(board))
  end
  display_board(board)
end

def won?(board)
  
  
end

 
 
 
  
  
  