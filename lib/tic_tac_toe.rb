require 'pry'

WIN_COMBINATIONS = [

  [0,1,2], # top row win
  [3,4,5], # middle row win
  [6,7,8], # bottom row win
  [0,3,6], # left column win
  [1,4,7], # middle column win
  [2,5,8], # right column win
  [2,4,6], # diagonal win 1
  [0,4,8], # diagonal win 2

]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input) # code your input_to_index and move method here!
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board,index) # code your #position_taken? method here!
  if board[index] == " " || board[index] =="" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  the_string_they_put_in = gets.strip
  their_desired_position = input_to_index(the_string_they_put_in)
    if valid_move?(board, their_desired_position)
    move(board, their_desired_position, current_player(board))
    display_board(board)
    else
    turn(board)
    end
end

def turn_count(board)
  move_count = 0
  board.each do |ex_or_o|
  if ex_or_o == "O" || ex_or_o == "X"
      move_count += 1
    end
  end
  move_count
end

def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end

  def won?(board)
    WIN_COMBINATIONS.detect do |combo|

    board[combo[0]] == board[combo[1]] && board[combo[1]] ==  board[combo[2]] && position_taken?(board,combo[0])

      end
    end

  def full?(board)
  board.all? do |marker|
    marker == "X" || marker == "O"
end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if win_array = won?(board)
    board[win_array.first]
  end
end

def play(board)
while !over?(board)
  turn(board)
end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
