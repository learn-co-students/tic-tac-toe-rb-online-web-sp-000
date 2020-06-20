#play method
def play(board)
until over?(board) == true
  turn(board)
end
if draw?(board) == true
  puts "Cat's Game!"
elsif won?(board) != nil
  v = winner(board)
  puts "Congratulations #{v}!"

end
end


#this congratulates the winner


# this is the turn method, its helper methods are INPUT_TO_INDEX, VALID_MOVE, MOVE, and DISPLAY_BOARD

def turn(board)

puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
if valid_move?(board, index) == true
  token = current_player(board)
  move(board, index, token)
  display_board(board)

else
  puts "Please enter 1-9:"
  turn(board)

end
end



#display_board method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


# code your input_to_index and move method here!
def input_to_index (input)
  return input.to_i - 1

end

#Move method
def move (array, index, value)
array[index]=value
end


#valid_move method
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,4,6],
  [0,4,8],
  [0,3,6],
  [2,5,8],
  [1,4,7],
]
#won needs to take in the board and the win combinations
#
#it needs check the indexes of each combo on the board
#for each board[WIN_COMBINATIONS[]]
#if any index combo is all Xs or all Os declare true


#won? method
def won?(board)
  if board.all? == " " || board.all? == nil
    return nil
  else
WIN_COMBINATIONS.detect do |win|
 board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X" ||
  board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"

    end
  end
end


#full? method
def full?(board)
  board.none? do |i| i == " " || i == ""
  end
end


#draw? method helpers: won? & full?
def draw?(board)
  if  won?(board) == nil && full?(board) == true
    return true
  end

end


#over? method, helpers: won? & draw?
def over?(board)
if won?(board) != nil || draw?(board) == true
  return true
end
end


#winner method

def winner(board)
if over?(board) == true && won?(board) != false
  return board[won?(board)[0]]
else
  return nil
end
end



#turn count needs to take in a board and count the number of spaces with an x or an o
def turn_count (board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  return counter
end


#current player needs to take in the board know how many turns have passed and determin if it is Xs turn or Os turn
def current_player(board)
  turns = turn_count(board) % 2
  if turns == 0
    return "X"
  else
    return "O"
end
end
