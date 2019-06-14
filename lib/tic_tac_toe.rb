# State methods
WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # diagonal from top left
    [2,4,6] # diagonal from top right
  ]
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Turn methods
def input_to_index(input)
  return input.to_i - 1
end

def move (board, index, character)
  board[index] = character
end

def position_taken? (board, index)
  return false if board[index] == " " || board[index] == "" || board[index] == nil
  true
end

def valid_move? (board, index)
  return true if index.between?(0, 8) && !position_taken?(board, index)
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

def turn_count (board)
  count = 0
  board.each do |position|
    count += 1 if position == "X" || position == "O"
  end
  count
end

def current_player (board)
  turn_count(board).even? ? "X" : "O"
end

# End game methods
def won? (board)
  WIN_COMBINATIONS.detect do |win_combination|
    board.values_at(win_combination[0], win_combination[1], win_combination[2]) == ["X", "X", "X"] || board.values_at(win_combination[0], win_combination[1], win_combination[2]) == ["O", "O", "O"]
  end
end

def full? (board)
  !board.find {|position| position == " "}
end

def draw? (board)
  return true if !won?(board) && full?(board)
  false
end

def over? (board)
  return true if won?(board) || draw?(board) || full?(board)
  false
end

def winner (board)
  return board[won?(board)[1]] if won?(board)
end

def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else 
    puts "Cat's Game!"
  end
end
  