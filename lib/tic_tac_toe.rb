WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]]

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
  user_input.to_i-1
  end

  def move(board, index, token)
  board[index] = token
    end

  def position_taken?(board, index)
if board[index] == " " || board[index] == "" || nil
return false
else
return true
end
end

def valid_move?(board, index)
index.between?(0, 8) && !position_taken?(board, index)
end


def turn(board)
puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)

if valid_move?(board, index)
  token = current_player(board)
  move(board, index, token)
  display_board(board)
else
puts "Oh, no! Looks like you gave an invalid move. Please try again."
turn(board)
end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      "#{counter}"
    end
  end
counter
end

def current_player(board)
if turn_count(board) % 2 == 0
 "X"
else
 "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_coordinates|
    win_index_1 = win_coordinates[0]
    win_index_2 = win_coordinates[1]
    win_index_3 = win_coordinates[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
end
end

def play(board)
until over?(board)
  turn(board)
end

if won?(board)
puts "Congratulations #{winner(board)}!"
else
puts "Cat's Game!"
end
end
