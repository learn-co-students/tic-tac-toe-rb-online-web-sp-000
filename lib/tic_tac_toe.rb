# Define your WIN_COMBINATIONS constant
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

# display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end

# move
def move(board, index, current_player)
  board[index] = current_player
end

#position_taken?
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# valid_move?
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# turn
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

# Define your play method below
def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end

# turn_count
def turn_count(board)
  count = 0 
  board.each do |el|
    if el == "X" || el == "O"
      count += 1
    end
  end
  count
end

# current_player
def current_player(board)
  player = "X"
  if turn_count(board) % 2 != 0
    player = "O"
  end
  player
end

# won?
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
      return combo
    end
  end
  nil 
end

# full?
def full?(board)
  is_full = board.all? do |el|
    el == "X" || el == "O"
  end
  is_full
end

# draw?
def draw?(board)
  is_draw = false 
  
  if full?(board) && !won?(board)
    is_draw = true 
  end
  
  is_draw
end

# over?
def over?(board)
  is_over = false 
  if won?(board) || draw?(board) || full?(board)
    is_over = true 
  end
  is_over
end

# winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil 
  end
end