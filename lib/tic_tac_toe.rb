require "pry"

WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left vertical
    [1,4,7], # Middle vertical
    [2,5,8], # Right vertical
    [0,4,8], # left diagonal
    [2,4,6] # right diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
    if board[index] == "X" || board[index] == "O"
      true
    elsif board[index] == " " || "" || nil
      false
    else board[index] == nil
      false
  end
end

def valid_move?(board, index)
    !position_taken?(board, index) && index.between?(0,8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
  move(board, index, current_player(board))
  display_board(board)
  else
  turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 === 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
WIN_COMBINATIONS.detect do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)

  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"} ? true : false
end


def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end
end
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
    if won?(board)
      winner(board) == "X" || winner(board) == "O"
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"


  end
end
