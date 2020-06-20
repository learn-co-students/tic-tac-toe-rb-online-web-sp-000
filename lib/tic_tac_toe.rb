# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]
# creates a new board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, token)
    board[index] = token
end

def position_taken?(board, index)
    !(board[index] == " " || board[index] == "" || board[index] == nil)
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

# turn
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if  valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

#turn_count
def turn_count(board)
  number_of_turns = 0
  board.each do |played|
    if played == "X" || played == "O"
    number_of_turns += 1
    end
  end
  return number_of_turns
end

#current_player
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

#won?
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
      return win_combo
    elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end

# full?
def full?(board)
  board.all? do |space_taken|
    space_taken != " "
  end
end

# draw?
def draw?(board)
  !(won?(board)) && (full?(board))
end

# over?
def over?(board)
(won?(board)) || (draw?(board)) || (full?(board))
end

# winner
def winner(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
      return "X"
    elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O"
      return "O"
    else
      puts "Cat's Game!"
  end
 end
end

# play
def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cat's Game!"
  end
end
