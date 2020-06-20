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
end

def input_to_index(input)
  return input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |moves| 
  if moves == "X" || moves == "O"
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

def won?(board)
  WIN_COMBINATIONS.each do |win_combinations|
    if win_combinations.all? { |i| board[i] == "X" }
      return win_combinations
    elsif win_combinations.all? { |i| board[i] == "O"}
      return win_combinations
   end
  end
 FALSE
end

def full?(board)
  if board.all? {|i| i == "X" || i == "O"}
    return true
  end
end

def draw?(board)
    if !won?(board) && full?(board)
      return true
    end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
end

if won?(board)
puts "Congratulations #{winner(board)}!"
else
puts "Cat's Game!"
end
end

