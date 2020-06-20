def display_board(board)
  puts "   |   |   "
  puts "___________"
  puts "   |   |   "
  puts "___________"
  puts "  |   |   "
  board = [" "," "," "," "," "," "," "," "," "]
end

display_board

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, X)
  board[index] = symbol
end

def position_taken?(board, index)
  if Array[index_number] == ""
    puts FALSE
  ifelse Array[index_number] == " "
    puts FALSE
  else 
    puts TRUE
  end 
  
  def valid_move? (board, index)
  if between (0, 8) = FALSE
    put "Not a Valid Move!"
    
    def position_taken?
  if index != nil
    index = FALSE
    
    def Welcome
puts "Weclome to Tic Tac Toe!"
end

def display_board(board)
  puts board 
end 

def position_taken?(board, index)
  if index != nil
    index = FALSE
    puts "Position is already taken! Please choose a valid move."
  end
end
  
def valid_move?(board, index)
  if between?(0,8) = FALSE
    puts "Invalid move! Please choose a number between 0 and 8."
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  loop do 
    counter = counter + 1
    if counter >= 9 
    break
  end
end

def turn_count(board)
  puts (turn_count)
  counter = 0 
  while count <= board.length 
  counter += 1 
  if counter >=9
  puts "End of Game"
  end
end 
  
def current_player(board)
  current_player.even?
  if TRUE
    current_player = "O"
  else current_player = "X"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = 
[
  [0, 1, 2]
  [3, 4, 5]
  [6, 7, 8]
  [0, 3, 6]
  [1, 4, 7]
  [2, 5, 8]
  [0, 4, 8]
  [2, 4, 6]
  ]

def won?(board)
   board.include(WIN_COMBINATIONS)
 end 
 
 def full?(board)
   board.any(" ")
 end 
 
 def draw?
   if full? = true && won?= false
 end 
 
 def over?
   if draw? || won? || full?
     puts "Game Over"
   end 

def winner(board)
  if WIN_COMBINATIONS.all? = "X"
    puts "Winner is Player X"
  else WIN_COMBINATIONS.all? = "O"
    puts "Winner is Player O"
  end
end 