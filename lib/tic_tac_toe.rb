# Helper Method
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], # bottom row
  [2, 4, 6],  #diagonal right to left
  [0, 3, 6], # left column
  [1, 4, 7], #middle column
  [2, 5, 8], # right column
  [0, 4, 8] # diagonal left to right
]

#display_board shows the current gameboard
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index changes user input into array index
def input_to_index(number)
  return (number.to_i - 1)
end

#won? Did a player attain victory
def won?(board)
  for win_combination in WIN_COMBINATIONS
    if (board[win_combination[0]] == 'X' && board[win_combination[1]] == 'X' && board[win_combination[2]] == "X")
      return win_combination
    elsif (board[win_combination[0]] == 'O' && board[win_combination[1]] == 'O' && board[win_combination[2]] == "O")
      return win_combination
    end
  end
  return false
end

#full? checks to see if the board is filled
def full?(board)
  is_full = board.all? do |position|
    (position == "X" || position == "O")
  end
  return is_full
end

#draw? checks if the match ends in a tie
def draw?(board)
  if (full?(board) && !won?(board))
    return true
  else
    return false
  end
end

#over? check to see if the game is done
def over?(board)
  if (draw?(board) || won?(board))
    return true
  else
    return false
  end
end

#winner declares who won the match
def winner(board)
  win = won?(board)
  if (!win)
    return nil
  elsif (board[win[0]] == "O")
    return "O"
  else
    return "X"
  end
end

#move tells player to move
def move(board, index, current_player)
  board[index] = current_player
end

#valid_move? makes sure move is legal
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#turn
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

#current_player determines whose turn it is
def current_player(board)
  if (turn_count(board) % 2 == 0)
    return "X"
  else
    return "O"
  end
end

#turn_count will keep track of how many turns have been played
def turn_count(board)
  num_of_turns = 0
  board.each do |spot|
    if (spot == 'X' || spot == 'O')
      num_of_turns += 1
    end
  end
  num_of_turns
end

#play starts the game of tic tac toe
def play(board)
  until over?(board)
    turn(board)
  end
  victor = winner(board)
  if (victor == 'X')
    puts "Congratulations X!"
  elsif (victor == "O")
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
