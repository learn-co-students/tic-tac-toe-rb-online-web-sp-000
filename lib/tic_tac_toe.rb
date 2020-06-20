def play(board)

until over?(board)
  turn(board)
end

if draw?(board)
  puts "Cat's Game!"
elsif winner(board)
  puts "Congratulations #{winner(board)}!"
elsif full?(board)
 puts "Full!"
end


end



def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(num)
  num.to_i - 1
end

def move(array, index, value)
  array[index] = value
end


def valid_move?(board,index)
  
 if position_taken?(board,index)
   return false
 elsif index.between?(0,8)
   return true

end
end

def turn(board) 
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  check = valid_move?(board,index)
  
  if current_player(board) == "X"
    value = "X"
  elsif current_player(board) == "O"
    value = "O"
  end
    
      if check == true
        move(board,index,value)
        turn_count(board)
        display_board(board)
      else
        turn(board) 
      end
    
end


def won?(board)
  
  winner_ = []
  
  WIN_COMBINATIONS.each do |array|
    if board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X"
      winner_ = array
    elsif board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O"
    winner_ = array
    else
    end
  end
  
  if winner_ != []
    return winner_
  else 
    return false

end
  
end




def full?(board)
  
  if board.count(" ") > 0 
    return false
  else 
    return true
  end
    
end


def draw?(board)
  
  if won?(board) == false && full?(board) == true 
    return true
  else
    return false
  end
  
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board)
    return true
  else
    return false
  end
end
  

def winner(board)
  winning_combo = won?(board)
  
  if winning_combo != false
  
    if board[winning_combo[0]] == "O"
      return "O"
     elsif board[winning_combo[0]] == "X"
       return "X"
     
     else
       
  end
end
end


def turn_count(board)
  count = 0 
  
  board.each do |turn|
    if turn == "X" || turn == "O"
    count += 1 
    else
    end
  
end

return count
end


def current_player(board)
  
if turn_count(board).even?
  return "X"
else 
  return "O"
end

end
