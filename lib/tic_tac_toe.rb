def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def play(board)
  until over?(board)
    turn(board)
  end

  if over?(board) && won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

#logic to run one turn of the game
def turn(board)
# ask for input
puts "Player #{current_player(board)}, please enter 1-9:"
# get input
input = gets.strip.to_i
# convert input to index
index = input_to_index(input)
# if index is valid
  if valid_move?(board, index)
    # make the move for index
    move(board, index, current_player(board))
    # show the board
    display_board(board)
  else
    # ask for input again until you get a valid input
    puts "Invalid move, please try again."
    turn(board)
  end
end


# converts user input to array index
def input_to_index(user_input)
  index = user_input.to_i - 1
end


# store move on array
def move(array, index, value)
  array[index.to_i] = value
end


# count the number of turns played
def turn_count(array)
  counter = 0
  #board_array = array
  array.each do |position|
    if position != " "
      counter += 1
    end
  end
  turn_count = counter
end


#determine if the move is valid
def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end


# determine the current players turn
def current_player(array)
  turn_count(array).even? ? current_player = "X" : current_player = "O"
end


# determine if the current position is taken
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Middle column
  [2,5,8], # Third column
  [0,4,8], # Diagonal down
  [2,4,6], # Diagonal up
]


# determine if the game is over
def over?(array)
  if won?(array) || full?(array) || draw?(array)
    true
  else
    false
  end
end


# determine if there is a winning combination
def won?(array)
  # assign a variable to the constant WIN_COMBINATIONS to work with
  win_combination = WIN_COMBINATIONS
  #iterate through untill we find a winning combo
  win_combination.find do |index|
    #check on the winning positions of the board and assign the boards value for each space
    winning_positions = [array[index[0]], array[index[1]], array[index[2]]]
    # check if all spaces are either X or O
    win_X = winning_positions.all? do |position|
      position == "X"
    end
    win_O = winning_positions.all? do |position|
      position == "O"
    end
    # report the results of the tests
    if win_X == true || win_O == true
      return winning_index = [index[0], index[1], index[2]]
    else
      false
    end
  end
end


# determine if there is a draw
def draw?(array)
  if full?(array)
    if !won?(array) && full?(array)
      true
    elsif !full?(array) && !won?(array)
      false
    else won?(array)
      false
      end
  else
    false
  end
end


# determine if the board is full
def full?(array)
  !array.include?(" ")
end


# determine who is the winner
def winner(array)
  if won?(array)
    return array[won?(array)[0]]
  else
    nil
  end
end
