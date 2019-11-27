# prints arbitrary arrangements of the board 

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts " -----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts " -----------" 
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

# converts user input to an integer 
 
def input_to_index(input)
  index = input.to_i - 1 
end

# allows the player to assign a token to an index on the board 

def move(board, index, token) 
  board[index] = token
end 

# determines if the position/index chosen by the user is taken or not 

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# returns true if the move is valid 

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8) ? true : false 
 end 

 # player makes a valid move 

 def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)
  if valid_move?(board, index)
    move(board, index, token)   #make the move for index 
    display_board(board)
  else 
    turn(board)
  end 
end  

# counts how many turns have been played 

def turn_count(board)
  counter = 0 
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1 
    end 
  end 
  counter 
end 

# if turn count is odd - current player is "O"
# if turn count is even - current player is "X"

def current_player(board)
  if turn_count(board).odd?
    "O"
  else 
    "X"
  end 
end  

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],  #top row 
  [3,4,5],  #middle row 
  [6,7,8],  #bottom row 
  [0,4,8],  #left diagonal 
  [2,4,6],  #right diagonal 
  [0,3,6],  #left column
  [1,4,7],  #middle column  
  [2,5,8]   #right column 
]

# determines if the game is won or not 
# return false for empty board or draw 
# else returns an array of the winning combo 

def won?(board)
  return false if board.all? { |index| index == " " || index == "" }
  winning_combo = [] 
  WIN_COMBINATIONS.each do |combo|
    if combo.all? { |index| board[index] == "X"} || combo.all? { |index| board[index] == "O"}
      winning_combo = combo 
    end
  end
  if winning_combo.empty? 
    return false 
  else 
    return winning_combo
  end 
end 

# returns true is the board is full 

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end 

# returns true if the board is full and has not been won 

def draw?(board)
  if full?(board) && !won?(board)
    true 
  else 
    false 
  end 
 end 

 # returns true if the game has been won, if the game is a draw or if the board is full 

def over?(board)
  if draw?(board) || full?(board) || won?(board) 
    true 
  else 
    false 
  end 
end 

# returns winner - "X" or "O" depending on which token won 
# returns nil if there is no winner 

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil 
  end 
end

def play(board)
  until over?(board) == true 
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else 
    puts "Cat's Game!"
  end
end 