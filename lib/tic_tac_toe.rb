#require "pry"

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)

if (board[index] == "X") || (board[index] == "O")
  true
elsif board[index] == " " || "" || nil
  false
  end
end

def valid_move?(board, index)
  index.to_i-1
  if index.between?(0,8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn_count(board)
  9 - board.count(" ")
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  index = gets.strip
  index = input_to_index(index)

  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

#binding.pry

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    #binding.pry
    board[win_combo[0] ] == board[win_combo[1] ] &&
    board[win_combo[1] ] == board[win_combo[2] ] &&
    position_taken?(board, win_combo[0])

    end
  end

  def full?(board)
    board.none? do |input|
      input == " "
    end
  end

  def draw?(board)
    if won?(board) || !full?(board)
      false
    else
      true
    end
  end

  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      true
    else
      false
    end
  end

  def winner(board)
    if won?(board)
      board[won?(board)[0]]
    end
  end

  def play(board)
    num_of_turns = 0

    while !over?(board)
      turn(board)
      num_of_turns += 1
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
  end
end
