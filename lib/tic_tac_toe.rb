# Test variables
test_board_1 = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
test_board_2 = ["X", "X", "X", "O", "O", " ", " ", " ", " "]

# Main Variables
WIN_COMBINATIONS = [
  #horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagonal
  [0,4,8],
  [2,4,6]
]

@player_1_choice = "X"
@player_2_choice = "O"

# Welcomes the user
def welcome
  puts "Welcome to Tic Tac Toe!"
end

# Asks for the user's token
def ask_token
  puts ("Please enter whether you want to start with X or O.")
  token = gets.strip

  if(token == "X" || token == "x")
    @player_1_choice = "X"
    @player_2_choice = "O"
  elsif (token == "O" || token == "o")
    @player_1_choice = "O"
    @player_2_choice = "X"
  else
    puts "Not a proper choice. Please enter again."
    ask_token
  end
end


# Asks for the user's move
def ask_move
  puts ("Please enter 1-9:")
  return gets.strip
end


# Displays the board to the user
def display_board(board)
  row = "-----------"

  puts "---------------------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts row
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts row
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts "---------------------"
end

# Converts input to index
def input_to_index(input)
  return input.to_i - 1
end

# Is the position taken on the board
def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    return false
  elsif (board[index] == "X" || board[index] == "O")
    return true
  end
end

# Is the move valid
def valid_move?(board, index)
  if (index >= 0 && index <= 8)
    if (position_taken?(board, index) == false)
      return true
    elsif (position_taken?(board, index) == true)
      return false
    end
  else
    return false
  end
end

# Running through a player turn
def turn(board, token)
  turn_count(board)
  puts "It is #{token}'s turn"
  move_input = ask_move
  index = input_to_index(move_input)

  if (valid_move?(board, index) == true)
    move(board, index, token)
  elsif (valid_move?(board, index) == false)
    puts "This is not a valid move."
    turn(board, token)
  end
end

# How many turns have gone by
def turn_count(board)
  turn_counter = 1

  board.each do |index|
    if (index == "X" || index == "O")
      turn_counter += 1
    end
  end

  puts "Turn: #{turn_counter}"
end

# Shows who is the current player
def current_player(board)
  if (turn_count(board) == 9)
    puts "The game is over."
  elsif (turn_count(board) % 2 == 0)
    return "X"
  elsif (turn_count(board) % 2 != 0)
    return "O"
  end
end

# Move the token
def move(board, index, token)
  board[index] = token
  display_board(board)
end

# Checks if someone has won
def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
   return false
end

# Checks if game board is full
def full?(board)
  board.all? do |position|
     !(position.nil? || position == " " || position == "")
  end
end

# Checks if game is draw
def draw?(board)
  if (won?(board) != false)
     return false
  elsif (won?(board) == false && full?(board) == false)
     return false
  elsif (won?(board) == false && full?(board) == true)
     return true
  end
end

# Checks for game over
def over?(board)
  if (won?(board) != false)
     true
  elsif (draw?(board) == true)
     true
  else
     false
  end
end

# Checks for winer
def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end


#Play the game
def play(board)
  ask_token
  
  until (over?(board) == true)
    turn(board, @player_1_choice)
    if (over?(board) == false)
      turn(board, @player_2_choice)
    else
      break
    end
  end
  if (draw?(board) == true)
    puts "Cat\'s Game!"
  elsif (won?(board) != false)
    puts "Congratulations #{winner(board)}!"
  end
end
