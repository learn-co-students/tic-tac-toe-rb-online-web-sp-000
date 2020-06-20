require 'pry'

WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],  # horizontal wins
  [0, 3, 6], [1, 4, 7], [2, 5, 8],  # verticle wins
  [0, 4, 8], [2, 4, 6]              # diagonal wins
].freeze

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# MAIN METHOD TO RUN THE GAME
def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif
    puts "Cat's Game!"
  end
end

# HELPER METHODS

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

# receive user input, convert it to an index
# if move is valid, display move on board
# otherwise, ask for a new position until valid move is received
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# returns the number of turns that have been played
def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

# determines if it is X (if even) or O's turn (if odd)
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

# detects first win then returns the win_combo (ex: [2,4,6]) OR if there is no win returns nil
# win when win_combo's array indexes 0, 1, 2 values are all equal & no empty spaces on board
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[0]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end

# returns true if every board element is "X" or "O" (full), otherwise returns false
def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

# returns true if the board has not been won but is full,
# returns false if the board is not won and the board is not full, and false if the board is won
def draw?(board)
  full?(board) && !won?(board)
end

# returns true if the board has been won, is a draw, or is full
def over?(board)
  won?(board) || draw?(board)
end

# returns either "X" or "O", depending on which has won the game given a winning board
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
