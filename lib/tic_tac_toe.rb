WIN_COMBINATIONS = [
  [0,1,2],  #top row 
  [3,4,5],  #middle row 
  [6,7,8],   #last row 
  [0,3,6],   #left column
  [1,4,7],   #middle columnn
  [2,5,8],   ##right column
  [0,4,8],   #diangle
  [6,4,2],    #diangle 
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, symbol)
  board[index] = symbol
end

def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil 
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
  board.each do |i|
    if i == "X" || i == "O" 
      counter += 1
    end
  end
  counter
end



def current_player(board)
if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn(board)
  puts "Please enter a number between 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board,index)
     turn(board)
  else
    move(board, index, current_player(board))
  end
  display_board(board)
end

def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   
   position_1 = board[win_index_1] # value of board at win_index_1
   position_2 = board[win_index_2] # value of board at win_index_2
   position_3 = board[win_index_3] # value of board at win_index_3
   
   if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combination
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
  if won?(board) || draw?(board) || full?(board) 
    return true 
  else
    return false
  end
end 


def winner(board)
if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end 


def play(board)
  while !over?(board) && !won?(board) && !draw?(board)
    turn(board)
  end

  if won?(board) 
   puts "Congratulations #{winner(board)}!"
  end 
  
  if draw?(board) 
    puts "Cat's Game!"
  end 
end   
  
  

  
  



