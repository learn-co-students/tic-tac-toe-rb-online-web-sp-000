WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

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
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do
    |character|
    if character == "X" || character == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turns = turn_count(board)
  turns.even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_arrays|
    pos1 = win_arrays[0]
    pos2 = win_arrays[1]
    pos3 = win_arrays[2]
    if board[pos1] == "X" && board[pos2] == "X" && board[pos3] == "X" || board[pos1] == "O" && board[pos2] == "O" && board[pos3] == "O"
      return win_arrays
    end
  end
  return false
end

def full?(board)
  board.each do |i|
    if i != "X" && i != "O"
     return false
    end
  end
  return true
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
  winner_index = won?(board)
  index = winner_index[0]
  return board[index]
 else
   return nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner_is = winner(board)
    puts "Congratulations #{winner_is}!"
    puts "Black Sabbath rules!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end