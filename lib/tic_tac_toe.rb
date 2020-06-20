require "pry"

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, position)
  if board[position] == "" || board[position] == " " || board[position] == nil
    return false
  elsif board[position] == "X" || board[position] == "O"
    return true
  end
end

def valid_move?(board, position)
  if position_taken?(board, position) == false && position.between?(0,8) == true
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == false
    turn(board)
  end
  move(board, index, current_player(board))
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index == "X" || index == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board).odd? == true
    return "O"
  elsif turn_count(board).even? == true || turn_count(board) == 0
    return "X"
  end
end

def won?(board)
  # If the board is empty return false
  if board.all?{|index| index == " "} == true
    return false
  end
  # If the board contains a winning combination return win_combination
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
  #If the board doesn't contain any winning combinations and the board is full return false
  if board.any?{|index| index == " "} == false
    return false
  end
end

def full?(board)
  #binding.pry
  if board.any?{|index| index == " "} == false
    return true
  else
    return false
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
  won?(board) || draw?(board)
  #binding.pry
#  if won?(board).class == Array && full?(board) == false
#    return true
#  elsif full?(board) == true && won?(board).class == Array
#    return true
#  elsif draw?(board) == true
#    return true
#  else
#    return false
#  end
end

def winner(board)
  if won?(board) == nil
    return nil
  end
  index = won?(board)[0]
  if board[index] == "X"
    return "X"
  elsif board[index] == "O"
    return "O"
  else
    return nil
  end
end

def play(board)
  while over?(board) == false
    turn(board)
  end
  #if over?(board) == true
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  #end
end
