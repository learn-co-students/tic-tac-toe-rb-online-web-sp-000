WIN_COMBINATIONS = [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
board = [" "," "," "," "," "," "," "," "," "]

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

def move(board,index,value)
 board[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (position_taken?(board, index))
    return false
  elsif index < 0 || index > 8
    return false
  else
    return true
  end
end

def turn_count(board)
 counter = 0
 board.each do |turn|
   if turn == "X" || turn == "O"
     counter += 1
  end
end
  return counter 
end

def current_player(board)
  counter = turn_count(board)
  if counter % 2 == 0 
    return "X"
  else 
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  a = input_to_index(input)
  if valid_move?(board, a) == false
   puts "Please enter 1-9:"
   index = gets.strip
   input_to_index(input)
  elsif 
    b = current_player(board)
    move(board, a, b)
    display_board(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.any? do |a|
  win_index_1 = a[0]
  win_index_2 = a[1]
  win_index_3 = a[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return a
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return a
  end
end
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true 
  else
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
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
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
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end

