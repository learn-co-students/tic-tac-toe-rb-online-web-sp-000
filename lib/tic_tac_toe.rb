# 1. define your #WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], # middle row
  [6,7,8], #bottom row
  [0,4,8], #left diagonal row
  [0,3,6], #left row
  [1,4,7], #vertical middle row
  [2,5,8], #right row
  [2,4,6] #right diagonal row
]

#2 & 3 define the board and #display_board method
board =[" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
display_board(board)

#4 define #input_to_index method, which takes the user_input (which is a string), converts it to an Integer, and subtracts 1
def input_to_index(user_input)
  user_input.to_i - 1
end

#5 define #move method
def move(board, index, marker)
  board[index] = marker
end

#6 define #position_taken? method
def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

#7 define #valid_move? method
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index) #if the position isn't taken and is on the board, the move must be valid
end

#8 define #turn method
def turn(board)
puts "Please enter 1-9:"
user_input = gets.strip
index = input_to_index(user_input)
if !valid_move?(board, index)  #asks for input again is the input is not valid
  turn(board)
else   #if the input is valid makes the move then
  move(board, index, current_player(board))
 end
 display_board(board)
end

#9 define #turn_count method
def turn_count(board)
counter = 0
board.each do |board_x|
  if board_x == "X" || board_x == "O"
counter += 1
   end
  end
return counter
end

#10 define #current_player method
def current_player(board)
if turn_count(board) % 2 == 0
  "X"
elsif turn_count(board) % 2 == 1
  "O"
  end
end

#11 define #won? method, which uses #each method to iterate through a nesed array.
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
        return win_combination
  end
 end
 return false
end

#12 define #full? method to check if the board is full.
def full?(board)
    board.all? do |board_full|
      board_full == "X" || board_full == "O"
    end
end

#13 define #draw? method
def draw?(board)
  if full?(board) == true && won?(board) == false
   true
  end
end

#14 define #over? method to ckeck if the current round of game if over.
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return nil
  end
end

#15 define #winner method to check who is the winner.
def winner(board)
 # returns X when X won, O when O won and nill when there is no winner
 if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end

#16 final - define #play method
def play(board)
  while !over?(board) && !won?(board) && !draw?(board) # if the game isnt over
    turn(board) # play another turn
  end

# if the game is over
  if won?(board)
   puts "Congratulations #{winner(board)}!"
 end

# if its a draw
 if draw?(board)
   puts "Cat's Game!"
 end

end
