# Define display_board that accepts a board and prints
# out the current state.
def display_board(board = [" "," "," "," "," "," "," "," "," "])
  row_one = " #{board[0]} | #{board[1]} | #{board[2]} "
  dashes = "-----------"
  row_two = " #{board[3]} | #{board[4]} | #{board[5]} "
  row_three = " #{board[6]} | #{board[7]} | #{board[8]} "
  puts row_one
  puts dashes
  puts row_two
  puts dashes
  puts row_three
end

#index = 0

# code your input_to_index and move method here!
def input_to_index(input)
  index = input.to_i - 1
end

#move method
def move(board, index, character)
  board[index] = character
end

# determing if the position has been taken
def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
    p false
    elsif board[index] == nil
      p false
    elsif board[index] == "X" || board[index] == "O"
      p true
  end
end

# making sure the user plays on the board
def valid_move?(board, index)
  #this first if statement is checking if the index is on the board and if the position has been taken
  if index.between?(0,8) && position_taken?(board, index) == false
    p true
  elsif index > 9 || index < 0
    p false
  elsif position_taken?(board, index) == true
    p false
  end
end

#returns the number of turns that have been played
def turn_count(board)
  #using the count method to count how many X's and O's are in the board array
  x = board.count("X")
  o = board.count("O")
  #adding the X's and O's together
  turn = x + o
  #we want the return value to be a number, so we use return
  return turn
end

#tells you whose turn it is
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn(board)
  #asking the user for their input
  puts "Please enter 1-9:"
  #the gets method actually *gets* the user input
  input = gets
  
  character = current_player(board)
  
  #now calling the input_to_index method to convert the input to an integer and to the proper ruby index equivalent
  index = input_to_index(input)
  
  #if the move is valid, we make the move and display the board
  if valid_move?(board, index) == true
    move(board, index, character)
    display_board(board)
  #otherwise, we ask for a new position
  else
    "Please enter 1-9:"
    input = gets
  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 4, 8], #left diagonal
  [2, 4, 6], #right diagonal
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8]  #right column
  ]
  
#define #won? method here
def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end

#counting so we don't return false until we have looked at all of the combinations.
count = 0

  WIN_COMBINATIONS.each do |combo|
    count = count + 1
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    elsif count == 8
      return false
    end
  end
end


#defining the #full? method
def full?(board)
  if board.any?(" ")
    return false
  else
    return true
  end
end


#defining the #draw? method
def draw?(board)
  if won?(board) != false || full?(board) == false
    return false
  else
    return true
  end
end

#method to determine if the game is over
def over?(board)
  #board that has been won and the board is NOT full --> true
  if won?(board) != false && full?(board) == false
    return true
  #board that has been won and the board is full --> true
  elsif won?(board) != false && full?(board) == true
    return true
  #board that is still in-progress --> false
  elsif won?(board) == false && full?(board) == false
    return false
  #board that's a draw --> true
  elsif draw?(board) == true
    return true
  end
end

#method to determine the winner and returns the winning token
def winner(board)
  #setting the index of the win into a variable, win
  win = won?(board)
  #now returning nil if there is no winner
  if won?(board) == false
    return nil
  #all indexes should have the same token for a win, so we're only checking the first
  elsif board[win[0]] == "X" && won?(board) != false
    return "X"
  elsif board[win[0]] == "O" && won?(board) != false
    return "O"
  end
end


#this play method works in irb
def play(board)
  #turn(board)
  i = 0
  until over?(board) == true
    turn(board)
    if draw?(board) == true
      break
    elsif won?(board) != false
      break
    elsif i == 9
      break
    end
  end
  
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
    elsif draw?(board) == true
      puts "Cat's Game!"
  end
end
















#third attempt
#play method
#def play(board)
  #for loop_count in 1..9 do
 # turn(board)
  #if over?(board) == true
   # break
  #elsif draw?(board) == true
    #puts "Cat's Game!"
    #break
  #elsif won?(board) == true
    #puts "Congratulations #{winner(board)}!"
    #end
    #break
    #end
  #end
#end



#second attempt
#play method
#def play(board)
  #for loop_count in 1..9 do
    #turn(board)
    #if over?(board) == true
     # break
    #elsif draw?(board) == true
     # puts "Cat's Game!"
      #break
    #elsif won?(board) == true
     #  puts "Congratulations, X!"
      #else
       # puts "Congratulations, O!"
      #end
      #break
    #end
  #end
#end


#First attempt: play method
  #done = false
  #loop_count = 0
  #creating a loop to see if the game is over
  #while done == false
   # turn(board)
    #loop_count =+ 1
    #puts loop_count
    #done = over?(board)
    #if loop_count > 9 
      #done = true
    #end
  #end