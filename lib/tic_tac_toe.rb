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
  
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  new_user_input = user_input.to_i
  new_user_input -= 1
  return new_user_input
end

def move(board, index, current_player)
  board[index] = current_player
  return board
end

def position_taken?(board, index)
  if (board[index] ==  " " || board[index] == "" || board[index] == nil)
    taken = false
  else
    taken = true
  end
end 

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else 
    turn(board)
  end
end

def turn_count(board)
  counter = 0 
  board.each do |value|
    if value == "X" || value == "O"
    counter += 1 
    end
  end
  return counter
end

def current_player(board)
  num = turn_count(board) 
  if num % 2 == 0 
    return 'X'
  else 
    return 'O'
  end
end 

def won?(board)
  winning_combo = nil
  WIN_COMBINATIONS.each do |combo|
    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]
  if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
    winning_combo = combo
  elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
    winning_combo = combo
  end
end
  winning_combo
end

def full?(board)
  (board).all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else won?(board) && full?(board) 
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
  if winning_combo = won?(board) #[0,1,2]
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) 
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end 
end




 