require 'pry'

# WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #First Column
  [1, 4, 7], #Second Column
  [2, 5, 8], #Third Column
  [0, 4, 8], #Diagonal left to right
  [2, 4, 6], #Diagonal right to left
]

# Display board method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Input to board index method to translate player input to valid board
def input_to_index(user_input)
  index = user_input.to_i - 1
end

# Move method to place move into board
def move(array, index, current_player)
  array[index] = current_player
end

# Determine if position has an "X" or "O" already in it
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Determine if a move is valid
def valid_move?(board, index)
  if index.between?(0, 8)
    !position_taken?(board, index)
  else
    false
  end
end

# Deterimin if the board has a winner.  If there is a winner, return the winning combination
def won?(board) 
  winning_array = []

  WIN_COMBINATIONS.each do |combo|
    board_values = []
    combo.each do |position_value|
      board_values.push(board[position_value]) 
      #puts "the current board value is #{board_values}"     
    end
    if board_values.all?{|values| values == "X" }|| board_values.all?{|values| values == "O"}
      winning_array = combo
    end
  end
  
  if winning_array == [] && full?(board) == true
    winning_array = false
  end

  if board.all?{|values| values == " " }|| board.all?{|values| values == ""}
    winning_array = false
  end

  winning_array  

end

# Check if the board is full
def full?(board)
  board.none? {|value| value == " "} ? true: false  
end

# Check if there is a draw
def draw?(board)
  won?(board) == false && full?(board) ? true : false
  # full?(board) && !won?(board)
end

# Check if the game is over
def over?(board)
  if draw?(board) || full?(board)
    true
  elsif won?(board) != false && won?(board) != []
    true
  else
    false
  end
end

# Return the winner, either "X" or "O"
def winner(board)
  winner = nil
  if won?(board).length == 3
    winning_array = won?(board)
    winner = board[winning_array[0]]
  end
  winner
end

#Complete turn method
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)    
  else
    puts "Invalid move!"
    turn(board)
  end
end

# Count the number of turns that have occured
def turn_count(board)
  count = board.select do |board_value|
    board_value == "X" || board_value == "O"
  end
  count_number = count.length
end

# Determine who the current player is
def current_player(board)
  count = turn_count(board)
  count.even? ? "X" : "O"
end

# Play method will run until the game is over
def play(board)
  until over?(board) == true
    turn(board)
  end
  # binding.pry

  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
  #  binding.pry
   puts "Cat's Game!"
  end

end
