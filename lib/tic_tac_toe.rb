# Define display_board that accepts a board and prints
# out the current state.

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Input to index method takes one argument (user input) 
# and updates the array and converts that string to an integer.
#  user_input.to_i - 1

def input_to_index(user_input)
  position = user_input.to_i - 1
end

# move method takes in three arguments 
# (board array, index player would like to fill out (position), and player's character). 
# Returns the modified array with the updated index corresponding to the player's token.

def move(board, position, character)
  board[position] = character
end

# #position_taken? method

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

# #valid_move? method

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# #turn method

def turn(board)
  # ask the user for input (position 1-9)
  puts "Please enter 1-9:"
  # get input
  user_input = gets.strip
  # calls input to index method
  index = input_to_index(user_input)
  # if index is valid
  if valid_move?(board, index)
    # make the move for index
    move(board, index, character = "X")
    # show the board
    display_board(board)
  # else
  else
    # ask for input again until you get a valid input
    turn(board)
# end
  end
end

# #play method

def play(board)
  round = 0
  until round == 9 #|| "someone wins"
    round += 1
    # call #turn
    turn(board)
  puts "You win!"
  end
end

# #turn_count method tells us how many turns have been played

def turn_count(board)
  counter = 0
  board.each do |player|
    # returns number of turns that have been played
    if player == "X" || player == "O"
      counter += 1
    end  
  end  
  return counter
end

# #current_player method

def current_player(board)
  #if turn count is an even number, should return "X"
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

# #position_taken? method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
# #won? method
  
def won?(board)
  # Returns false/nil if no win combination present and return the winning combination indexes as an array if there is a win
  # iterate over WIN_COMBINATIONS (a nested array) and check if board has the same player token in each index of a winning combination
  WIN_COMBINATIONS.find do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
  end
end

# #full? method

def full?(board)
  # Return true if every element in the board contains either "X" or "O"
  # Returns false for an in-progress game
  board.none?{|index| index == " " || index == nil}
end

# #draw? method

def draw?(board)
  # Returns TRUE if the board is NOT WON, but it is FULL (a draw)
  # Returns FALSE if the board is NOT WON and the board is NOT FULL
  # Returns FALSE if the board is WON
  !(won?(board)) && full?(board) 
end

# #over? method

def over?(board)
  # Returns TRUE if the board has been won, is a draw, or is full
  # Compose using the methods I created
  won?(board) || draw?(board) || full?(board)
end

# #winner method

def winner(board)
  # Return the token "X" or "O" that has won the game given a winning board
  if won?(board)
    winning_token = won?(board)
    board[winning_token[0]]
  else
  end  
end