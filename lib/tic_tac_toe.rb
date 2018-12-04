# Define your WIN_COMBINATIONS constant
require 'pry'
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diagonal1
  [6,4,2], # Diagonal2
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8]  # Right column
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input) #defines a method converting the number entered to the board index
  user_input.to_i - 1
end

def move(board,input_to_index,charactor)
  board[input_to_index] = charactor
end

def position_taken? (board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board,index)
  if position_taken?(board,index) == false && index.between?(0,8)
      true
  else
      false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  charactor = "X"
    if valid_move?(board, index) == true
      move(board, index, charactor)
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  number = 0
  board.each do |position|  #itterating thru board in a loop checking for X or O
    if position == "X" || position == "O"
    number += 1
    end
  end
  return number
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

#itteratting thru WIN_COMBINATIONS array each element being another array
def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    # win_combo = [3,4,5]
    index_0 = win_combo[0]
    # index_0 = 3
    index_1 = win_combo[1]
    # index_0 = 4
    index_2 = win_combo[2]
    # index_0 = 5

    position_1 = board[index_0]
    #   position_1 = "X" || "O" || ""
    position_2 = board[index_1]
    #  position_2 = "X" || "O" || ""
    position_3 = board[index_2]
    #  position_3 = "X" || "O" || ""

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

# .all? implies an if statment looking at each postion of the board. It's a boolean method
def full?(board)
  board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    player = board[win_combo[0]]
    return player
  end
end
# binding.pry

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations"
  elsif draw?(board)
    puts "Game is a Draw"
  end
end

# display_board(board)
# play(board)
