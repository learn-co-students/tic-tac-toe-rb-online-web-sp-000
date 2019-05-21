WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, index, value = "X")
  board[index] = value

end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

# code your #valid_move? method here
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip                #create local variable 'input' that gets input from player. 'strip' eliminates whitespace.
  index = input_to_index(input)     #convert input to correct index with method call (#input_to_index(input))
  if valid_move?(board, index)      #if move is valid (allowed)
    move(board, index)              #call to #move making user move for index
  else
    turn(board)                     #reiterate turn if previous turn failed
  end
  display_board(board)            #show the board
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def move(board, index, value)
  board[index] = value                #set move on our board equal to a value. Default is X.
end

def play(board)
  turn_counter = 0            #initialize number of turns to count to start at 0 (Therefore we get 9 loops)
  while turn_counter < 9      #while turns are <= to 9
    turn(board)               #make your turn
    turn_counter += 1         #add to turn count loop
  end
end
#turn_count takes in argument board array, returns number of turns that have been played
#current_player method takes in an argument of board array and uses #turn_count method to determine if it is "X"'s turn or "O"'s

def turn_count(board)
  turns = 0                             #initialize turns variable starting at 0
  board.each do |token|                 #iterate each element on board. token is variable label for our array to be passed into the block of code
    if token == "X" || token == "O"     #if tokens are either X or O add to turn count
      turns += 1
    end
  end
  return turns                           #returns turns. Listed in lab requirements. "Control return value of a method that uses iteraton in body"
end                                      #This return could also be just: turns. However including 'returns' helps understanding

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"    #call #turn_count. Ternary operators ? : looks for true/false values then executes
end                                         #using a modulo. if condition is true ? then "X" : otherwise value "O"

def won?(board)     #check the board return true if win, false if not

  WIN_COMBINATIONS.detect do |combo|          #iterating (detecting) CONSTANT for winning combos
    board[combo[0]] == board[combo[1]] &&     #conditions for a WIN
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])           #takes board and index as arguments, returns true if position empty
  end
end
def full?(board)          #accepts board, returns true if every element in the board contains either an "X" or an "O"
  board.all? do |token|   #iterator: all? block passed to it must return true for every iteration
    token == "X" ||       #true for only X and O's
    token == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)      #call to methods if board NOT won, but is FULL! Returns true only in those cases!
  puts "Cat's Game!"
end

def over?(board)
    won?(board) || draw?(board) || full?(board)
end

def winner?(board)
  if winning_combo == win?(board)
    board[winning_combo.first]
  end
end
