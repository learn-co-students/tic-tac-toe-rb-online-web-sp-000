def input_to_index(user_input)
  input = user_input.to_i - 1
  input
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def position_taken?(array, index)
  if array[index] == " " || array[index] == "" || array[index] == nil
    return false
  elsif array[index] == "X" || array[index] == "O"
    return true
  end
end

def valid_move?(array, index)
  if index.between?(0, 8) && !position_taken?(array, index)
    return true
  end
end

def move(array, index, character)
  array[index] = character
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  input = input_to_index(user_input)
  if valid_move?(board, input)
    move(board, input, current_player(board))
    display_board(board)
  else
    puts "Please enter 1-9:"
    user_input = gets.strip
    input = input_to_index(user_input)
  end
end

def play(board)
  i = 1
  while i < 9 do
  if over?(board)
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  else
    turn(board)
  end
  i += 1
end
end

def turn_count(array)
  num_turns = 0
  array.each do |i|
    if i == "X" || i == "O"
      num_turns += 1
    end
  end
  num_turns
end


def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

# Helper Method
def position_taken?(board, index)
!(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 4, 8],
[2, 4, 6],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8]
]

def won?(board)
WIN_COMBINATIONS.each do |i|
  win_index_1 = i[0]
  win_index_2 = i[1]
  win_index_3 = i[2]
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return i
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return i
  else
    false
  end
end
false
end

def full?(board)
if (board.select{|i| i == "X" || i == "O"}).length < 9
  return false
else
  return true
end
end


def draw?(board)
if full?(board) == true && won?(board) == false
  return true
else
  return false
end
end

def over?(board)
if full?(board) == true
  return true
elsif won?(board)
  return true
elsif draw?(board)
  return true
else
  return false
end
end

def winner(board)
winner = won?(board)
if winner != false
  if board[winner[0]] == "O"
    # puts "Congratulations O, you won!"
    return "O"
  elsif board[winner[0]] == "X"
    # puts "Congratulations X, you won!"
    return "X"
  end
end
end
