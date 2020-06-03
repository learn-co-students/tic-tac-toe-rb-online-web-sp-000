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
  user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, user_input)
  if board[user_input] == "X" || board[user_input] == "O"
    return true
  else
    return false
  end
end

# def valid_move?(board, location)
#   if board[location] == "X" || board[location] == "O" || !location.between?(0, 8)
#     return false
#   else
#     return true
#   end
# end

def valid_move?(board, user_input)
  if position_taken?(board, user_input) || !user_input.between?(0, 8)
    return false
  else
    return true
  end
end

# def current_player
#   turn_count.even == true ? "X" : "O"
# end
#
# def turn_count(board)
#   counter = 0
#
#   board.each do |turn|
#     if turn == "X" || turn == "O"
#       counter += 1
#       puts "#{counter}"
#     end
#   end
#
#   counter
# end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, token = "X")
    puts display_board(board)
  elsif valid_move?(board, index) == true
    move(board, index, token = "O")
    puts display_board(board)
  elsif valid_move?(board, index) == false
    puts "Please enter 1-9:"
    user_input = gets.chomp
  else
    puts "Please enter 1-9:"
    user_input = gets.chomp
  end
end

def turn_count(turn)
  counter = 0

  turn.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      puts "#{counter}"
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? == true ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(board, combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo
    return board[winning_combo[0]]
  end
end

def play(board)
  input = gets
  while over?(board) == false
    turn(board)
  end

  if draw?(board)
    puts "That's Game!"
  elsif winner(board) == "X"
    puts "Congradulations X!"
  elsif winner(board) == "O"
    puts "Congradulations O!"
  end
end
