WIN_COMBINATIONS = [
  [0, 1, 2], #top row #combo 1
  [3, 4, 5], #middle row #combo 2
  [6, 7, 8], #bottom row #combo 3
  [0, 3, 6], #left column #combo 4
  [1, 4, 7], #middle column #combo 5
  [2, 5, 8], #right column #combo 6 
  [0, 4, 8], #diagonal left #combo 7 
  [2, 4, 6] #diagonal right #combo 8
  ]
  
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
  
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board) 
  counter = 0 
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    end 
  end 
  counter 
end 

def current_player(board)
  if turn_count(board).even? 
    "X"
  else 
    "O"
  end 
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


  def won?(board)
    winner = nil 
    WIN_COMBINATIONS.find do |individual_combo|
      if board[individual_combo[0]] == board[individual_combo[1]] && board[individual_combo[1]] == board[individual_combo[2]] && position_taken?(board, individual_combo[0])
      individual_combo
        end 
      end
  end


def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end 
end 


def draw?(board)
  full?(board) && !won?(board)
end 


def over?(board)
  won?(board) || draw?(board) || full?(board)
end 


def winner(board)
  maybe_winning_array = won?(board)
  if maybe_winning_array == nil 
    nil 
  else 
    spot_in_board = maybe_winning_array[0]
    board[spot_in_board]
  end 
end 



def play(board)
  until over?(board)
    turn(board)
  end 
  winnerwinnerchickendinner = winner(board)
  if won?(board) 
    puts "Congratulations #{winnerwinnerchickendinner}!"
  else draw?(board) 
    puts "Cat's Game!"
  end 
end
