WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5],  # Middle row
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  return index
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def move(board, index, token)
  board[index] = token
  return board
end

def position_taken?(board, index)
  !(board[index] == nil || board[index] == " ")
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
    if valid_move?(board, index) == true
      return move(board, index, token) && display_board(board)
    else  puts 'try again'
    turn(board)
  end
end
