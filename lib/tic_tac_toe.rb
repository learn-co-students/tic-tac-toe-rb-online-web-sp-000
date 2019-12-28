# Define your WIN_COMBINATIONS constant
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
  
CHARACTER_SET = ["X", "O"]

# ------- win helper methods --------

#Returns true if the board has a win on it and false if it does not
def won?(board)
  any_winning_combination(board)
end

#Iterates through all of the WIN_COMBINATIONS and see if there is a winning combination
def any_winning_combination(board)
  WIN_COMBINATIONS.detect do |combination|
    any_char_combo?(combination, board)
  end
end

#Checks winning_combo? for all characters
def any_char_combo?(combination, board)
  CHARACTER_SET.any? do |character|
    winning_combo?(combination, board, character)
  end
end

#Sees if there is a win for a specific combination, board, and character.
def winning_combo?(combination, board, character = "X")
  combination.all? do |index|
    board[index] == character
  end
end

#-------- full methods --------

def position_taken_spot?(spot)
  spot != " " && spot != "" && spot != nil
end

def full?(board)
  board.all? {|spot| position_taken_spot?(spot)}
end

#-------- draw methods --------

def draw?(board)
  !won?(board) && full?(board)
end

#-------- over? methods --------

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

#-------- winner methods --------

def winner(board)
  #Stores the value of won
  win = won?(board)
  #Checks to see if it it true
  if win
    #Returns the value for the thing in the board for index won[0]
    board[win[0]]
  end
end

#Returns the number of turns that have elapsed from a given board
def turn_count(board)
  turn = 0
  board.each do |spot|
    if spot != " " && spot != "" && spot != nil 
      turn += 1 
    end
  end
  turn
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#Returns the cahracer of the current player
def current_player(board)
  turn  = turn_count(board)
  if turn % 2  == 0 #is even
    "X"
  else
    "O"
  end
end

# Helper Methods
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

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

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

# Define your play method below
def play(board)
  until over?(board) do
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif
    puts "Cat's Game!"
  end
end