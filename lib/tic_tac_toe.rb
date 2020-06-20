WIN_COMBINATIONS = [
 [0,1,2], #0 'top row win'
 [3,4,5], #1 'middle row win'
 [6,7,8], #2 'bottom row win'
 [0,3,6], #3 'first column win'
 [1,4,7], #4 'second column win'
 [2,5,8], #5 'third column win'
 [0,4,8], #6 'left diagonal win'
 [2,4,6]  #7 'right diagonal win'
]


def display_board(board) #Our method that prints out the arrangement of items on the board.
  puts " #{board[0]} | #{board[1]} | #{board[2]} "   #   |   |
  puts "-----------"                                 #-----------
  puts " #{board[3]} | #{board[4]} | #{board[5]} "   #   |   |
  puts "-----------"                                 #-----------
  puts " #{board[6]} | #{board[7]} | #{board[8]} "   #   |   |
end


def input_to_index(number) #Method accepts one argument, the user's input, represented by 'number'.

  number.to_i-1 #The '.to_i' converts the value of a variable to an integer.

  #We then subtract '1' since the array starts with a value of '0', not '1'.
end


def move(array, index, value) #Defines 3 arguments: the board array, the index value the user chose, and the value of their character.
  array[index] = value #Takes our array with empty spaces, selects a value, and sets that value equal to the user character.
end


def position_taken?(board, index) #Accepts 2 arguments: the array of the board and the index of the array.
  #If the board space is empty, following the conditions below, it returns false.
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O" #If the space is occupied by 'X' or 'O', it returns true.
    return true
  end

end


def valid_move?(board, index) #First, we define a method with 2 arguments: the board array and an index value in the array.
  #Next, we create our conditional. It first checks the 'position_taken?' method to see if the space on the board is open.
  if position_taken?(board,index) == false && index.to_i.between?(0, 8) #Then, it also checks under the 'and' operator the index number to see if it is a valid board place.
    return true #If both conditions are met, the conditional returns true. If not, a falsey value will be returned.
  end

end


def turn(board) #Defines a method that takes the argument of board array.
  puts "Please enter 1-9:" #Displays a string prompting the user for a number.
  number = gets.to_i #Stores the user's value as a variable and converts to an integer.

  index = input_to_index(number) #Converts user number to a number compatible with our array.

  validity = valid_move?(board,index) #Checks to make sure the user made a valid move on the board.

  if validity == true #If the move was valid, the conditional runs the 'move' method and places the value in our board array
    move(board,index,current_player(board)) #We modify our former method to include 'current_player', this way we can have the user choice be returned as our value.
    display_board(board) #We then display the updated board back to the user.
  else
    turn(board) #If the move was invalid, we call the turn method again and prompt the user for a different input.
  end

end


def turn_count(board) #Accepts the argument of our board array.
  counter = 0 #Creates a variable and sets its value to '0'.

  board.each do |turn| #Takes the values from the board array, plugs them into the local variable 'turn'.
    if turn == "X" || turn == "O" #Checks to see if the space in the array is occupied by either 'X' or 'O'.
      counter += 1 #Every time we encounter the value, we add 1 to the counter
    end
  end
  counter #Calls the counter with the final total of items. Very important, otherwise our code does NOTHING.
end



def current_player(board) #Accepts an argument of our board array.

  turn_number = turn_count(board) #First, we create a variable and set it equal to the result of our 'turn_count' method.

  #Then, create an 'if' statement that checks to see if the value of that variable is even or odd.
  if turn_number.even? #Alternatively, it could've been written 'if turn_number % 2 == 0'.
    return "X" #All even numbers will return 'X'
  else
    return "O" #If the value is odd, an 'O' will be returned instead.
  end

end


def won?(board)

  WIN_COMBINATIONS.detect do |win_combination| #First, it reads thhrough each element in 'WIN_COMBINATIONS'.
    win_index_1 = win_combination[0] #For each element (which is an array), it assigns the value at [0] to the variable 'win_index_1'
    win_index_2 = win_combination[1] #Next, it does the same for the value in that array at [1]
    win_index_3 = win_combination[2] #Finally, the value at [2] is assigned, allowing our code below to analyze the contents of each sub-array.
    # board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # The code below takes our game board array and checks to see if any combination exists that is a winning match.
    board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && board[win_index_1] != " "
  end # If a winning combination is found, the 'detect' will return the array. If not, it returns a falsey value.
end

def full?(board)

  board.all? do |value| #The '#all?' goes through each value of the array to see if it meets the conditions required below.
    value == "X" || value == "O"
  end #If every value is equal to either "X" or "O", then we know the board is full and it is a draw. It will return true.
end #Otherwise, the game is still in progress since a " " was detected, returning false.


def draw?(board)

  if full?(board) && !won?(board) #returns true if the board is full and there are no winning combinations.
    return true
  end

end

def over?(board)

  if won?(board) || full?(board) #returns true if the board has a winning move or the board is full with no winning moves.
    return true #Will return true if the game is over.
  end

end

def winner(board)

  winner = won?(board) #First, we set the variable 'winner' equal to the array resulting from our 'won?' method (if a winning combo is found).
  #We then jump into a conditional statement. If we have a winner, we want to check what character won the game: 'X' or 'O'.
  if winner #First, let's say we had a diagonal winner ([0,5,8]). We can call any value from this array and set it equal to a variable.
    winning_character = winner[1] #winning_character is set equal to the value of the called array position. In this case, we call the middle value of '5'.
    return board[winning_character] #then, we return the board position of the winning_character value, which could be read as 'board[5]'
  else #if there are not winning combinations found, we return a value of 'nil'
    nil
  end

end


def play(board)

   until over?(board) || draw?(board) #This loops checks if the game is over by win or draw. It plays through a full game.
      turn(board) #If the game is not over, it allows the user to take another turn.
   end #The result of the loop will be a 'true' value for either 'over?' or 'draw?'

   # We then create a condition to output the results of the game to the user.
   if won?(board) # If a user, either 'X' or 'O' won the game...
      winner(board) == "X" || winner(board) == "O" #First, we check to see who the winning character was.
      puts "Congratulations #{winner(board)}!" #Once we determine if it was 'X' or 'O', we return an interpolated string with that character.
   elsif draw?(board) #If the game ended in a draw, we simply return the string below.
      puts "Cat's Game!"
   end

end
