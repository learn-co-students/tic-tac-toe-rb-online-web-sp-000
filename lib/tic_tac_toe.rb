WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
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

def move(array, index, value)
  array[index] = value
end

def position_taken?(board, location)
  board[location] == "X" || board[location] == "O"
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if valid_move?(board, index) == true
  unit = current_player(board)
  move(board, index, unit)
  display_board(board)
else
  turn(board)
 end
end

def turn_count(board)
counter = 0
board.each do |board_space|
if board_space == "X" || board_space == "O"
counter += 1
 end
end
counter
end

def current_player(board)
turn_count(board)
if turn_count(board) % 2 == 0
  "X"
else turn_count(board) % 2 == 1
  "O"
 end
end

def won?(board)
 WIN_COMBINATIONS.each do |element|
   result = []
   element.select{|position| result << board[position]}
   if result == ["X", "X", "X"] || result == ["O","O","O"]
    return element
    end
   end
  return false
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
 !won?(board) && full?(board)
end

def over?(board)
 draw?(board) || won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end

def play(board)
  while !over?(board)
    turn(board)
end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 elsif draw?(board)
   puts "Cat's Game!"
 end
end
