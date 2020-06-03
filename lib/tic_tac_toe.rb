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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, user_input)
  if board[user_input] == "X" || board[user_input] == "O"
    return true
  else
    return false
  end
end

def valid_move?(board, location)
  if board[location] == "X" || board[location] == "O" || !location.between?(0, 8)
    return false
  else
    return true
  end
end

# def valid_move?(board, user_input)
#   if position_taken?(board, user_input) || !user_input.between?(0, 8)
#     return false
#   else
#     return true
#   end
# end

def current_player
  turn_count.even == true ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"  # Asking the user for their move by position 1-9.
  user_input = gets.chomp   # Receiving the user input.
  index = input_to_index(user_input)     # Convert user input to an index
  if valid_move?(board, user_input) == true && current_player == "X"
    move(board, index, token = "X")
    puts display_board
  elsif valid_move?(board, user_input) == true && current_player == "O"
    move(board, index, token = "O")
    puts display_board
  elsif valid_move?(board, user_input) == false
    puts "Please enter 1-9:"
    user_input = gets.chomp
  else
    puts "Please enter 1-9:"
    user_input = gets.chomp
  end
end
# If the move is valid, make the move and display board.
# Otherwise (that is, if the move is invalid) ask for a new position until a valid move is received.
#
