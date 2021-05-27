#methods to run my 2 player tic-tac-toe game

# all of the winning combinations in tic tac toe
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,5,8],
  [1,4,7],
  [0,3,6],
  [0,4,8],
  [2,4,6]
]

# displays the game board as an array
def display_board(board=" ")
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# converts the user input to a usable array input
def input_to_index(user_input)
  user_input.to_i - 1
end


def move(board, index, current_player)
  board[index] = current_player
end

# validates the user input as a "possible" move, in two methods
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    true
  else
    false
  end
end

# counts the total charcters on the board to get turn_count
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter +=1
    end
  end
  counter
end

# decides wether its exes or the Oh oh oh's they want me
def current_player(board)
  counter = turn_count(board)
    if counter % 2 == 0
      return "X"
    else
      return "O"
    end
  end

# defines all of the actions that make up a completed turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# checks the current turn to see if the board contains a winner
def won?(board)
  WIN_COMBINATIONS.detect do |combinations|
    position_1 = board[combinations[0]]
    position_2 = board[combinations[1]]
    position_3 = board[combinations[2]]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
   true
  else
   false
 end
end
end

# makes sure there are spots left to continue on with the game
def full?(board)
  board.all? do |pos|
     pos == "X" || pos == "O"
    end
  end

# if the board becomes full, but none of the won conditions are met yet calls a draw
  def draw?(board)
    if full?(board) && !won?(board)
      true
    else
      false
    end
  end

# determines if the game is over
  def over?(board)
  if won?(board) || full?(board)
    true
  else
    false
  end
end

# determines wether X or O won the match
  def winner(board)
    if won?(board)
      board[won?(board)[0]]
    end
  end

# begins the process of the game, looks out for and displays messages for victory and tie
def play(board)
  until over?(board) || draw?(board)
    turn(board)
  end
     if won?(board)
      puts "Congratulations " +winner(board)+ "!"
    elsif draw?(board)
      puts "Cat's Game!"
  end
end
