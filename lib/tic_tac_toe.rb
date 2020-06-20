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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, player_symbol)
  board[position] = player_symbol
end

def position_taken?(board, position)
  if board[position] == "X" || board[position] == "O"
    return true
  end
  return false
end

def valid_move?(board, position)
  !position_taken?(board, position) && position.between?(0, 8)
end

def turn(board)
  puts "Choose a position to move to (1-9), 1 = top left 9 = bottom right"
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
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn = turn_count(board)
  if turn.even? || turn == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    idx1 = win_combo[0]
    idx2 = win_combo[1]
    idx3 = win_combo[2]
    if board[idx1] == "X" && board[idx2] == "X" && board[idx3] == "X"
      return win_combo
    elsif board[idx1] == "O" && board[idx2] == "O" && board[idx3] == "O"
      return win_combo
    end
  end
  return false
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    return board[win_combo[0]]
  end
  return nil
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end

end
