# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

#displays the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts the input to index
def input_to_index(user_input = 0)
  index = (user_input.to_i - 1)
end

#marks X or O based on user's input
def move(board, index, character)
  if character == "X"
    board[index] = "X"
  else character == "O"
    board[index] = "O"
end
end

#helper method to see if it is open
def position_taken?(board, index)
  if board[index] == "X"
    true
  elsif board[index] == "O"
    true
  else
    false
  end
end

#validates code to check that it is a valid move
def valid_move?(board, index)
  if (index.between?(0,8) == true) && (position_taken?(board, index) == false)
    return true 
  else
    return false
  end
end

#combines helper methods to take a turn
def turn(board)
  character = current_player(board)
puts "Please enter 1-9:"
user_input = gets.strip
user_input = user_input.to_i
index = input_to_index(user_input)
 if valid_move?(board, index) == true
   move(board, index, character)
   display_board(board)
  else 
    turn(board)
  end
end

#the meat!
def play(board)
 i = 0
 while i < 9
 i += 1
if won?(board)
  winner = winner(board)
  puts "Congratulations #{winner}!"
elsif over?(board)
  puts "Game over! Thanks for playing."
else
  turn(board)
end
end
end
    
#helper method to count # of turns
def turn_count(board)
  x_turns = board.count("X")
  o_turns = board.count("O")
  turn_count = x_turns + o_turns
  return turn_count
end

#the meat: determines next player
def current_player(board)
  turn_count = turn_count(board)
  if turn_count%2 != 0 
    "O"
 else
    "X"
  end
end
  
#Determines if someone won and returns sub_array of winning combo
def won?(board)
for sub_array in WIN_COMBINATIONS do
winning_index_1 = sub_array[0]
winning_index_2 = sub_array[1]
winning_index_3 = sub_array[2]

board_index_1 = board[winning_index_1]
board_index_2 = board[winning_index_2]
board_index_3 = board[winning_index_3]

 if (board_index_1 == "X" && board_index_2 == "X" && board_index_3 == "X") || (board_index_1 == "O" && board_index_2 == "O" && board_index_3 == "O") 
  return sub_array
end
end
false
end

#Tells you if there are still empty spaces
def full?(board)
  if board.include?(" " || "" || nil)
    false
  else
    true 
  end 
end

#Tells you if the board is a draw
def draw?(board)
  if won?(board) 
    return false
  elsif !full?(board)
    false 
  else
    puts "Cat's Game!"
    true
end 
end 

#Tells you if the game is over (is it a draw? Did someone win?)
def over?(board)
 if draw?(board) 
   return true
elsif won?(board)
  return true 
else
  false 
end
end

#Tells you who won based on that winning sub_array combination
def winner(board)
sub_array = won?(board)
  if !won?(board)
    return nil
  elsif board[sub_array[1]] == "X"
   return "X"
  elsif board[sub_array[1]] == "O"
   return "O"
  end
end