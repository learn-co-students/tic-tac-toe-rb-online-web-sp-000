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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  return user_input = user_input.to_i - 1
end

def move(board, position, token)
  index = position
  board[index] = token
end

def valid_move?(board,index)
 if index.between?(0,8) && position_taken?(board,index) != true
   true
 else
 end
end

def position_taken?(board,index)
  if board[index] == "X" || board[index] == "O"
    true
  else board[index] != " "
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  9 - board.count(" ")
end

def current_player(board)
  counter = 0
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    location1 = win_combination[0]
    location2 = win_combination[1]
    location3 = win_combination[2]

    board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
  end
end

def full?(board)
  board.none? { | position | position == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    winning_location = win_combination[0]
    board[winning_location]
  else
    nil
  end
end

def play(board)
  turn(board) until over?(board)
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
