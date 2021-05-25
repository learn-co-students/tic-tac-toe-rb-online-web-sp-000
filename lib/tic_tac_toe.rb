#These are the board array indicies that are game winning combinations
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


#Displays the game board to players when called.
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} " 
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} " 
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} " 
end


#Converts the users input from a str to an int and subtracts 1 so that it now equates to the correct board array index for the position they wish to play.
def input_to_index(input)
  input.to_i - 1
end


#Assigns the position on the board the player chose with their character... either "X" or "O" via the board array index.
def move(board, index, player_character)
  board[index] = player_character
end


#Checks to see if the players move is valid by checking to see if the array element is empty or doesn't have a value. If the position is taken it returns false, otherwise returns true.
def position_taken?(board, position)
  board[position] == " " || board[position] == nil ? false : true
end


#Uses the #position_take? method to check the move is valid and also checks the position (board array index) is a valid one between 0-8.
def valid_move?(board, position)
  position_taken?(board, position) == false && position.between?(0, 8) ? true : false
end


#Turn_count method tracks how many turns have been taken in the game. Each element that contains either an "X" or "O" will increase the count by 1. There are 9 turns total in a game of Tic Tac Toe.
def turn_count(board)
  count = 0
  board.each { |element|
    element == "X" || element == "O" ? count += 1 : false
  }
  count
end


#Tracks whether player "X" or player "O" is the current player.
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end


#Defines the player turn. 
#1. Asks users for a board position between 1-9.
#2. Users input gets assigned to variable 'input'
#3. #input_to_index helper method is called to convert user input from str, to int and then to the equivalent array index value. This is assigned to variable 'position'.
#4. Call valid_move? helper method. If the move is valid (true): call #move helper method and place the character "X" or "O" in that position. Then display the updated game board.
#5. If valid_move? is false. Until valid_move? is true, do recursion and repeat the #turn method.
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  position = input_to_index(input)
  
  if valid_move?(board, position) == true
    move(board, position, current_player(board))
    display_board(board)
  else
    until valid_move?(board, position) == true
      turn(board)
      break
    end
  end
end


#won? checks the board array against the WIN_COMBINATIONS to see if any of the indicies are full of either "X"'s or "O"'s.
def won?(board)
  WIN_COMBINATIONS.detect do |element|
  if board[element[0]] == "X" && board[element[1]] == "X" && board[element[2]] == "X"
    element
  elsif board[element[0]] == "O" && board[element[1]] == "O" && board[element[2]] == "O"
    element
  else
    false
  end
  end
end


#full? checks to see if the board array elements are full with "X"s and "O"s.
def full?(board)
  board.all? { |element| element == "X" || element == "O" }
end


#draw? checks to see if there is a draw. If there is no winning combination (nil value) and the board is full (true) it returns true, otherwise returns false.
def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  else
    false
  end
end


#over? checks to see if the game is over. It checks for a draw and returns true. Checks for NOT no value on #won? (I.E. there is a winning combination) and the board is full, returns true. Lastly, checks for NOT no value on #won? (I.E. there is a winning combination) and the board isn't full, returns true. Otherwise returns false and the game isnt over.
def over?(board)
  if draw?(board)
    true
  elsif won?(board) != nil && full?(board) == true
    true
  elsif won?(board) != nil && full?(board) == false
    true
  else
    false
  end
end


#winner? checks to see which player: "X" or "O" is the winner and return that letter. If the #won? method returns a value (the winning combination array) we take the board array and use the winning combination to see which character "X" or "O" has won.
def winner(board)
  if won?(board) != nil
    board[won?(board)[0]]
  else
  end
end


#play method plays the game and will loop until someone wins or its a draw.
def play(board)
  until over?(board) == true
  turn(board)
  end
  if won?(board) != nil
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end



