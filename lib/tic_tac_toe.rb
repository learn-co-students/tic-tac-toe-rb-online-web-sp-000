# Helper Methods
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board = ["X", "X", "X", " ", " ", " ", " ", " ", " "])
  WIN_COMBINATIONS.each do |combination|
    curr_values = []
    combination.each do |cur_index|
      curr_values << board[cur_index]
    end
    if curr_values.all? {|value| value == "X"} || curr_values.all? {|value| value == "O"}
      return combination
    end
  end
  return false
end

def full? (incomplete_board)
  if incomplete_board.all? {|space| space == "X" || space == "O"}
    return true
  else
    return false
  end
end

def draw? (board)
  won = won?(board)
  full = full?(board)
  if won == false && full == true
    return true
  elsif won == false && full == false
    return false
  else
    return false
  end
end

def over? (board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    indexes = won?(board)
    return board[indexes[0]]
  end
end

def turn_count(board)
  counter = 0
  board.each do |symbol|
    if symbol == "X" || symbol == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  num_turns = turn_count(board)
  if num_turns.even? == true
    return "X"
  else
    return "O"
  end
end

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

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  cur_player = current_player(board)
  puts "#{cur_player}, Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, cur_player)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  turns = 0
  until over?(board) == true do
    turn(board)
    turns += 1
  end
  if won?(board) != false && draw?(board) == false
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
