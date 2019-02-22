WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts   "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts   "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#num = gets.chomp

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
if board[index] == "X" || board[index] == "O"
  true
else
  false
end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn (board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |move|
if move == "X" || move == "O"
    counter += 1
  end
end
counter
end

def current_player(board)
if turn_count(board) % 2 == 0
   "X"
else #turn_count % 2 != 0
   "O"
  end
end


def won?(board)
WIN_COMBINATIONS.each do | win_combination |
position_1 = board[win_combination[0]]
position_2 = board[win_combination[1]]
position_3 = board[win_combination[2]]

if
  position_1 == "X" && position_2 == "X" && position_3 == "X"
  return win_combination

elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_combination
  end
end
return false
end


def full?(board)
board.all? do |board|
board == "X" || board =="O"
end
end

def draw?(board)
if !won?(board) && full?(board)
  return true
else
  return false
end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true

  else
    false
  end
end


def winner (board)
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end


def play(board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
end
over?(board)

if over?(board) == false
  turn(board)
  over?(board)
play(board)

elsif winner(board) == "X"
  puts "Congratulations X!"

elsif winner(board) == "O"
  puts "Congratulations O!"

elsif draw?(board) == true
  puts "Cat's Game!"
end
end
