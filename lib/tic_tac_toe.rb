WIN_COMBINATIONS = [
  [0,1,2],  # top row | index 0 
  [3,4,5],  # middle row | index 1
  [6,7,8],  # bottom row | index 2
  
  [0,3,6],  # left column | index 3
  [1,4,7],  # middle column | index 4
  [2,5,8],  # right column | index 5
  
  [0,4,8],  # top left to bottom right | index 6
  [2,4,6]   # top right to bottom left | index 7
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index.to_i - 1
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && board[index] != "X" && board[index] != "O"
end

def move(board, index, player)
  board[index] = player
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  
  if valid_move?(board,index)
    player = current_player(board)
    move(board,index, player)
    display_board(board)
  else 
    turn(board)
  end
end 

def turn_count(board)
  counter = 0 
  board.each do |spot_taken|
    if spot_taken == "X" || spot_taken == "O"
      counter += 1
    end
  end
return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    board = "X"
  else
    board = "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each  do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif 
      position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
    elsif
      false
    end
  end

  if board.all?{|i| i == " "}
    return false
  else
    board.any?{|i| i == " "}
      return false 
  end
end

def full?(board)
  if board.all?{|i| i == "X" || i == "O"}
    return true
  else
    board.any?{|i| i == " "}
      return false
  end
end

def draw?(board)
  won?(board) == false && full?(board)
end

def over?(board)
  if won?(board) || draw?(board)
    return true 
  end
end

def winner(board)
  if won?(board)
    winning_array = won?(board)
    i = winning_array[0]
    return board[i]
  end
end

def play(board)
  
  until over?(board)
    turn(board)
  end
  
  if won?(board)
     puts "Congratulations #{winner(board)}!"
  else draw?(board)
     puts "Cat's Game!"
  end
end

