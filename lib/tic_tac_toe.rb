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
  
  def display_board(board)
  
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

end

def input_to_index(user_input)
  return user_input.to_i - 1
end

def move(board, position, char)
  board[position] = char
  end

def position_taken?(board, index)
if board[index] == " " || board[index] == ""
    return false
  elsif board[index] == nil
    return false
  else board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    return false
  end

  position_taken?(board, index)
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
  counter = 0
  board.each do |turn|
    if turn == "X" 
    counter += 1
    elsif turn == "O"
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

# def won?(board)
    
#     WIN_COMBINATIONS.each do |win_combination|
 
# if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
#   return win_combination
 
# end
# if board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
#   return win_combination
# end
# end
# return false
# end

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
      board[win_combination[0]] == board[win_combination[1]] && 
      board[win_combination[1]] == board[win_combination[2]] && 
      position_taken?(board, win_combination[0])
    end
end

def full?(board)
  WIN_COMBINATIONS.none? do |win_combination|
  if board[win_combination[0]] == " " 
    return false
    elsif board[win_combination[1]] == " "
    return false
    elsif board[win_combination[2]] == " "
    return false
  end
end
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
  if won?(board)  
      win_combination = won?(board)
      board[win_combination[0]] 
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
  
#   turn_num = 0
#   turn(board)
#   over?(board)
#   while turn_num < 8
#   turn(board)
#   turn_num += 1
# end
end