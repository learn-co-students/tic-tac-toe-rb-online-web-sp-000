
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [6, 4, 2],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
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

def move(board, index, player)
   board[index] = player
end

def position_taken?(board, index)
  board[index] != " " || board[index] != ""
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, player = "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X"
      counter += 1
    elsif turn == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
win_index_1 = win_combination[0]
win_index_2 = win_combination[1]
win_index_3 = win_combination[2]

position_1 = board[win_index_1] # load the value of the board at win_index_1
position_2 = board[win_index_2] # load the value of the board at win_index_2
position_3 = board[win_index_3] # load the value of the board at win_index_3

position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_2)
end
end

board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
def full?(board)
  board.all? do |player|
    # binding.pry
    player == "X" || player == "O"
  end
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
  board[won?(board)[0]]
end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)

  else
    draw?(board)
  end
  end
