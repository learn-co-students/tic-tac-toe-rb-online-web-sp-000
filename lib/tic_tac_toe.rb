#The 8 different win combinations in a nested array
WIN_COMBINATIONS = [
  [0,1,2],#top row 0
  [3,4,5],#middle row 1
  [6,7,8],#bottom row 2
  [0,3,6],#left column 3
  [1,4,7],#middle column 4
  [2,5,8],#right column 5
  [0,4,8],#top left to bottom right 6
  [2,4,6]#top right to bottom left 7
]

#Prints the tic tac toe game board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts user input from string to int and subtracts 1 from value
def input_to_index(input)
  input.to_i - 1 #user can input number between 1-9, array is 0-8
end

#updates the board array at the given index with the provided token ("X" or "O")
def move(board, index, token)
  board[index] = token
end

#checks if index in board is taken or not
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

#check if user input is a valid move
def valid_move?(board,index)
  #return true for valid position on empty board (between 0-8)
  if index.between?(0,8) && position_taken?(board,index) == false
    return true
  else
    return false
  end
end

#Runs one tic tac toe turn
def turn(board)
  puts "Please enter 1-9:"
  #get input from user
  input = gets
  #Converts input from user to index
  index = input_to_index(input)
  #Sets token to current player ("X" or "O")
  token = current_player(board)
  #If input is valid
  if valid_move?(board, index)
    #Make the move for input
    move(board, index, token)
    #Diplsay current board
    display_board(board)
  else turn(board)
  end
end

#counts the number of turns during the game
def turn_count(board)
  #set count to 0 at start of game
  count = 0
  #iterate over board array
  board.each do |moves|
    #Look for an "X" or an "O" in the array
    if moves == "X" || moves == "O"
      #Increase count by 1 if "X" or "O" is found
      count += 1
    end
  end
  return count
end

#Returns the proper token based on which turn it is
def current_player(board)
  #if turn count is an even number
  if turn_count(board) % 2 == 0
    return "X"
  #if turn count is an odd number
  else
    return "O"
  end
end

#won? method returns true if there is a win and false if there isnt
def won?(board)
  #iterate over WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |current_index|
    win_index_1 = current_index[0]
    win_index_2 = current_index[1]
    win_index_3 = current_index[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    #If all three elements within the winning combination are "X"
    if position_1 == "X" &&  position_2 == "X" &&  position_3 == "X"
      #return "X"
      return current_index
    #else if all three elements within the winning combination are "O"
    elsif position_1 == "O" &&  position_2 == "O" &&  position_3 == "O"
      #return "O"
      return current_index
    end
  end
  return false
end

#full board method
def full?(board)
  #Returns true if all elements inside board are either "X" or "O"
  board.all? {|token| token == "X" || token == "O"}
end

#draw game method
def draw?(board)
  #returns true if board is full and game is not won
  full?(board) && !won?(board)
end

#game over method
def over?(board)
  #if game is won or if board is full
  if won?(board) || full?(board) || draw?(board)
    #return true
    return true
  end
end

#winner winner chicken dinner
def winner(board)
  #if game is won
  if won?(board)
    #return element at the zeroth index of winning combination
    return board[won?(board)[0]]
  end
end

#play method
def play(board)
  #until game is over
  until over?(board)
    #loop turn
    turn(board)
  end
  #if game is won
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
