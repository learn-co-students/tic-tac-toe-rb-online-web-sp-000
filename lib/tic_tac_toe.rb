WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #left diagonal
  [2,4,6]  #right diagonal
  ]
  
 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

def input_to_index(input)
   input = input.to_i - 1 
end

 def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  else board[index] == " " || "" 
    return false
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
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
     else
      turn(board)
    end
    display_board(board)
end

def turn_count(board)
  board.count('X') + board.count('O')
end

def current_player(board)
  turn_count(board).even? ? "X" : "O" 
end

def won?(board)
  winner = nil
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| board[index] == "X"}
      winner = win_combo
    elsif win_combo.all? {|index| board[index] == "O"}
      winner = win_combo
    else
      false
    end
  end
  if winner != nil
    winner
  else
    false
  end
end

def full?(board)
  board.all? do |index|
    if index == "X" || index == "O"
      true
    else
      false
    end
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if winner = won?(board)
    board[winner[0]]
  end
end

def play(board)
 while !over?(board) && !won?(board) && !draw?(board) 
    turn(board) 
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end


