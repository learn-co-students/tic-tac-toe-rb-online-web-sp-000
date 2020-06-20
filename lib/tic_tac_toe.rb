#rspec spec/01_tic_tac_toe_spec.rb
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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  elsif !valid_move?(board, index)
  until valid_move?(board, index)
   puts "Please enter 1-9:"
   input = gets
   index = input_to_index(input)
  end
   move(board, index, current_player(board))
 end
 display_board(board)
end

def turn_count(board)
counter = 0
  board.each do |count|
    if count == "X" || count == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
 turn = turn_count(board)
  if turn.even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return win
    end
  end
  i = 1
  for empty_board in board
    if position_taken?(board, i)
    return false
     i += 1
    end
  end
  if !full?(board)
    return false
  end
end

def full?(board)
  i = 0
  until i == board.length
    if position_taken?(board, i)
      full_board = true
    else
      return false
    end
    i += 1
  end
  return full_board
end

=begin
def full?(board)
  if position_taken?(board, 0) && position_taken?(board, 1) && position_taken?(board, 2) && position_taken?(board, 3) && position_taken?(board, 4) && position_taken?(board, 5) && position_taken?(board, 6) && position_taken?(board, 7) && position_taken?(board, 8)
    return true
  else
    return false
  end
end
=end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    winner = won?(board)
    if board[winner[0]] == "X" && board[winner[1]] == "X" && board[winner[2]] == "X"
      return "X"
    elsif board[winner[0]] == "O" && board[winner[1]] == "O" && board[winner[2]] == "O"
      return "O"
    end
  else
    return nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
