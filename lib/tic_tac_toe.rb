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
  
  def display_board(board=[])
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(user_input)
  user_input.to_i-1
end

def move(board,position,value)
board[position] = value
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " "  
    false
  elsif board[index] == ""
    false
  else  
    false
  end
end

def valid_move?(board,index)
index.between?(0,8) && !position_taken?(board,index)
end

def turn(board)
  puts "Please enter 1-9:"
  answer = gets.strip
  response_index = input_to_index(answer)
  if valid_move?(board,response_index)
    move(board,response_index,current_player(board))
  else 
    puts "This is not valid"
    turn(board)
  end
   display_board(board)
end

def turn_count(board)
 counter = 0 
 board.each do |moves|
   if moves == "X" || moves == "O"
   counter +=1 
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


def won?(board)
  WIN_COMBINATIONS.each do|combo|
  #part below – grabs each index of winning combo
  win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]
  
  #part below – loads value of board at index
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
  if position_1 == "X" &&
    position_2 == "X" &&
    position_3 == "X"
      return combo
  elsif position_1 == "O" &&
    position_2 == "O" &&
    position_3 == "O"
      return combo
  else
  end
end
false
end

def full?(board)
  if board.all? {|word| word == "X" || word =="O"}
    true 
  else
    false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board) == true
    return true
  else
  end
end

def winner(board)
  WIN_COMBINATIONS.each do|combo|
   win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    end
  end
  nil
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) +"!"
  else
    puts "Cat's Game!"
  end
end