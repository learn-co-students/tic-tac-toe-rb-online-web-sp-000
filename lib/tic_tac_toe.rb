# define what a win looks like
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,4,8], # \ diagonal
  [2,4,6], # / diagonal
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8] # right column
]

# make a board
def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

# convert user choice to an array index
def input_to_index(input)
  index = input.to_i - 1
end

# make a game move
def move (board, index, char)
  board[index] = char
end

# check for empty spaces
def position_taken? (board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

# is the player allowed that move?
def valid_move?(board,index)
  if !index.between?(0,8)
    return false
  elsif !position_taken?(board,index)
    return true
  end
end

# take a valid turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# counts turns
def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  return counter
end

# determines current player
def current_player(board)
  if turn_count(board) % 2 == 0
    player = "X"
  else
    player = "O"
    return player
  end
end

# did someone win?
def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    if win_array.all?{|board_position| board[board_position] == "X"}
      return win_array
    elsif win_array.all?{|board_position| board[board_position] == "O"}
      return win_array
    end
  end
  if board.all?{|space| position_taken?(board, space.to_i)} || board.none?{|space| position_taken?(board, space.to_i)}
    return false
  end
end

# is the board full?
def full?(board)
  board.all?{|space| space == "X" || space == "O"}
end

# is it a draw?
def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

# is the game over?
def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  end
end

# who won?
def winner(board)
  if won?(board)
    winning_array = won?(board)
    token_index = winning_array[0]
    token = board[token_index]
    token
  end
end

# play the game
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
