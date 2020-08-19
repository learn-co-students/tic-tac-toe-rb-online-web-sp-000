# Nested Array defining winning move combinations
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # center column
  [2,5,8], # right column
  [0,4,8], # top l to bottom r diagonal
  [2,4,6] # top r to bottom l diagonal
]

# Displays the playing board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Converts the user's input to an array index
def input_to_index(input)
  input.to_i - 1
end

# This Method accepts the player's move
def move(board, index, current_player)
  board[index] = current_player
end

# Determines if a position on the board is occupied
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# Determines if a move is valid
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# Counts the number of turns taken
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

# Determines the current player
def current_player(board)
  if turn_count(board).even? == true
    return "X"
  else
    return "O"
  end
end

# Method for taking a turn
def turn(board)
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Method for determining if a game has been won
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combination
    end
  end
  return false
end

# Determines if the board is full
def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

# Determines if the game is a draw
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

# Determines if the game is over
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

# Determines the winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

# Loops through the game until it comes to a conclusion
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else if draw?(board)
    puts "Cat's Game!"
  end
  end
end
