WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Row one down
  [1,4,7],  # Row two down
  [2,5,8],  # Row three down
  [0,4,8],  #Horizontal left to right
  [2,4,6],  #Horizontal right to left
]

board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
display_board(board)

def input_to_index(user_input)
  user_input.to_i - 1
end
#
def move(board, index, token)
  board[index] = token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != " "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, current_player)
    board[index] = current_player
  end

  def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, character = current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
 board.each {|space|
   if space =="X" || space == "O"
     counter += 1
end
 }
 counter
 end

 def current_player(board)
  turn_count(board) % 2 == 0? "X" : "O"
  end


  def won?(board)
 WIN_COMBINATIONS.detect do  |win_combination|
   board[win_combination[0]] == board[win_combination[1]] &&
   board[win_combination[1]] == board[win_combination[2]] &&
   position_taken?(board, win_combination[0])
 end
 end

 def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
    full?(board) && !won?(board)
  end

  def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end


def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
