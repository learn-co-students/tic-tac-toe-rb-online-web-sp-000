require 'pry'

#define win combinations
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
#display_board that prints an arbitrary arrangements of the board
def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts "-----------"
end
board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
display_board(board)
board = %w[X O X O X X O X O]
display_board(board)

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)
  index.to_i - 1
  board[index] = token
  # board[index] = token
  # if board[index] == " " || board[index] == "" || board[index] == nil
    # true
  # else
# end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
   false
  else
   true
end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  9 - board.count(" ")
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
end
end

def turn(board)
  token = current_player(board)
  puts "Please enter a move: 1-9"
  index = gets.strip.to_i - 1
  if valid_move?(board,index)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] && board[win[2]] == board[win[0]] && position_taken?(board, win[0])
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win = won?(board)
  if win
    "#{board[win[0]]}"
  else
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
end
