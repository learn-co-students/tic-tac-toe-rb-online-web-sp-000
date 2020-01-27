require 'pry'

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
  output = user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  # binding.pry
  #if user finds an empty space, it should return true
  #if user finds a space already used, it should return false
  if !position_taken?(board, index) && index.between?(0,8)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please choose your next move: Spaces 1-9"
  # move = gets.strip
  space = input_to_index(gets.strip)
  if valid_move?(board, space)
    move(board, space, "X")
  else
    puts "Invalid selection, please try again./n"
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each_with_index do |i, n|
    turn += 1 if position_taken?(board, n)
  end
  turn
end
