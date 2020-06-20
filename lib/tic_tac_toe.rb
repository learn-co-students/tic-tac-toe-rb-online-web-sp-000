def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end 
def move(display_board, index, character="X")
display_board[index]=character
end


def position_taken?(board,index)
  if board[index]=="" || board[index]==" " || board[index]== nil
return  false
else
  return true 
  
end 
  end 
  

def valid_move?(board,index)
  if !position_taken?(board,index) && index.between?(0,8)
    return true 
  else return false 
end 
end 

def move(display_board, index, character)
display_board[index]=character
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter= 0 
  board.each do |player|
    if player=="X" || player=="O"
      counter+=1 
end 
end 
return counter 
end 


def current_player(board)
  turn=turn_count(board) 
  if turn.even?
    return "X"
  else return "O"
end
end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]

]




def won?(board)
  WIN_COMBINATIONS.each { |win_comb|
    win_index_1 = win_comb[0]
    win_index_2 = win_comb[1]
    win_index_3 = win_comb[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_comb
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_comb
    end
  }
  return false
end

def full?(board)
if board.none? {|token|token== " "|| token=nil}
return true 
else return false 

end 
end 

def draw?(board)
 if full?(board) &&!won?(board)
 return true 
else
  return false
    
  end 
end 

def over?(board)
  if draw?(board) && won?(board) 
    return true 
    elsif won?(board)&& !full?(board) || won?(board)&&full?(board)
    return true 
    elsif draw?(board) 
    return true 
  else return false 
  end 
end 


def winner(board) 
  win = won?(board)
  if win == false
    return nil
  else
    if board[win[0]] == "X"
      return "X"
    else
      return "O"
    end
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