# Helper Method
board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def input_to_index(user_input)
  converted_input = user_input.to_i - 1
end

def move(board, index, value)
    board[index.to_i] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  if position_taken?(board, index) != true && index.between?(0,8)
    true
  else
    false
  end
end

def turn(board)
  if !over?(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    puts "Please chose token 'X' or 'O':"
    value = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board,index)
      move(board, index,value)
    display_board(board)
    else
      puts "invalid number entry, please try again"
      turn(board)
    end
  else
    break
  end
end

def turn_count(board)
  board.count do |marker|
    marker == "X" || marker == "O"
  end
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|marker| marker == "X" || marker == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end


