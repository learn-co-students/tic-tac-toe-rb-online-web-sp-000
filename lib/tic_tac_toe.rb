require "pry"

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

def display_board(board)
  # board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board("")

# code your input_to_index
  def input_to_index(input)
    # convert input to integer and subtracts 1
    input.to_i - 1
  end

# code the move method here!
  def move(array, index, character)
    array[index] = character
  end

  # code your #position_taken? method here!

def position_taken?(array, index)
  if array[index] == " " || array[index] == "" || array[index] == nil
    return false
  elsif array[index] == "X" || array[index] == "O"
    return true
  end
end

# code your #valid_move? method here
def valid_move?(array, index)
  if index.between?(0,8) && !position_taken?(array, index)
    return true
  else position_taken?(array, index) == true
    return false
  end
end

# turn method
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  valid = valid_move?(board, index)
  # check that index is valid
    if valid == false
      turn(board)
    else
      move(board, index, current_player(board))
      display_board(board)
    end
end

def turn_count(board)
  # use each to iterate over the elements of the board
  # to check if that element is an X or O and increment counter by 1
  # return value of each is the original array
  counter = 0
  board.each do |space_count|
    if space_count == "X" || space_count == "O"
        counter += 1
        puts "#{space_count}"
        # return counter
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
      return "X"
  else
      return "O"
  end
end

def won?(board)
  winner = []
  empty_board = board.all? { |empty| empty == " " || empty == nil}
  WIN_COMBINATIONS.each do |win_combo|
    # binding.pry
    if win_combo.all? { |value| board[value] == "X"} || win_combo.all? { |value| board[value] == "O"}
      winner = win_combo
      return winner
    end
  end
  return false
end

# check to see if the board is full
def full?(board)
  board.all? { |full| full == "X" || full == "O"}
end

# returns true if the board has not been won but is full,
# false if the board is not won and the board is not full,
# and false if the board is won


def draw?(board)
  full?(board) && !won?(board)
end

# returns true if the board has been won, is a draw, or is full.
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

# return the token, "X" or "O" that has won the game given a winning board
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
# until the game is #over?, take turns
  until over?(board)
      turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat\'s Game!"
  end

end
