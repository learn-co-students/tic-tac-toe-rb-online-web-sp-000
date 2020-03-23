require 'pry'

# Defines all possible winning combinations.
# ––––––––––––––––––––––––––––––––
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left-to-right diagonal
  [2,4,6]  # Right-to-left diagonal
]



# Creates board structure and allows for the placement of placeholders ('X' or 'O').
# ––––––––––––––––––––––––––––––––
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



# Takes number input by user and converts it to the correct index.
# ––––––––––––––––––––––––––––––––
def input_to_index(user_input)
  user_input.to_i - 1
end



# Defines where the user will make move and which character to be used (either "X" or "O").
# ––––––––––––––––––––––––––––––––
def move(board, index, player_token)
  board[index] = player_token
  board
end



# Verifies if spot on the board is empty or taken.
# ––––––––––––––––––––––––––––––––
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end



# Verifies if move is within 'board' array and if chosen spot is still taken.
# –––––––––––––––––––––––––––––––– 
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end



# Prompts user input, converts user input to index, and checks if move is valid. If not, process is repeated until user inputs a valid move.
# ––––––––––––––––––––––––––––––––
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player_token = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end



# Counts the amount of filled spaces on board to check how many turns have been taken.
# ––––––––––––––––––––––––––––––––
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  return counter
end



# This method is hard-coded to start the game with "X" and returns "X" or "O".
# ––––––––––––––––––––––––––––––––
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end



# The #won? method that returns 'true' if there is a win and 'false' if not
# ––––––––––––––––––––––––––––––––
def won?(board)
  
  # Iterates through WIN_COMBINATIONS and finds first matching win_combination and returns the winning array.
  WIN_COMBINATIONS.detect do |win_combination|
  
  # Each 'win_index' returns the first, second, and third elements of each winning combo array.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  # Each 'position' uses the indices from the winning combos and applies them to the 'board' array.
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
  # Takes first win_combination and checks to see if they are all "X"'s or "O"'s and that the string is not empty.
  position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
  end
end



# Returns 'true' for a draw and 'false' for an in-progress game.
# ––––––––––––––––––––––––––––––––
def full?(board)
  # If no 'board_position'/s are empty, returns 'true'. If 'board_position'/s remain empty, returns 'false'.
  if board.none? {|board_position| board_position == " "}
    true
  end
end



# Accepts a 'board' and returns 'true' if the board has not been won but is full, 'false' if the board is not won and the board is not full, and 'false' if the board is won.
# ––––––––––––––––––––––––––––––––
def draw?(board)
  # board is full, but not won
  if full?(board) && !won?(board)
    true
  # board is not full and not won
  elsif
    false
  # false for game won in first row or game won diagonally
  # elsif won?(board) == [0,1,2] || won?(board) == [0,4,8] || won?(board) == [2,4,6]
  #   false
  end
end



# Accepts a 'board' and returns 'true' for a draw, a won game w/ full board, won game w/ incomplete board, and returns 'false' for an in-progress game.
# ––––––––––––––––––––––––––––––––
def over?(board)
  draw?(board) || won?(board)
  # if full?(board) && won?(board)
  #   true
  # elsif won?(board)
  #   true
  # elsif !full?(board) && !won?(board)
  #   false
  # elsif draw?(board)
  #   true
  # end
end



# Returns 'X' or 'O' depending on winning token of game.
# ––––––––––––––––––––––––––––––––
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end



# This method runs the game.
# ––––––––––––––––––––––––––––––––
def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end