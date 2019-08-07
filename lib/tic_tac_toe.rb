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
  converted_input = input.to_i - 1
  return converted_input
end

def move(board, input, char)
  puts board[(input)] = char
end

def position_taken?(board, index)
  if board[index] == ' '
    false
  elsif board[index] == ''
    false
  elsif board[index] ==  nil
    false
  elsif board[index] == 'X' || board[index] == 'O'
    true
  else
    true
  end
end

def valid_move?(board, index)
  if index < 0 
    false
  elsif board[index] == " "
    true
  elsif board[index] == "X" || board[index] == "O"
    false
  elsif board[index] == ""
    true
  else
    false
  end
end

def turn(board)
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
      count += 1
    else
      count += 0 
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def won?(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X"
    WIN_COMBINATIONS[0]
  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
    WIN_COMBINATIONS[0]
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    WIN_COMBINATIONS[1]
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
    WIN_COMBINATIONS[1]
  elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
    WIN_COMBINATIONS[2]
  elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
    WIN_COMBINATIONS[2]
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
    WIN_COMBINATIONS[3]
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    WIN_COMBINATIONS[3]
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
    WIN_COMBINATIONS[4]
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    WIN_COMBINATIONS[4]
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
    WIN_COMBINATIONS[5]
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    WIN_COMBINATIONS[5]
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
    WIN_COMBINATIONS[6]
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
    WIN_COMBINATIONS[6]
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
    WIN_COMBINATIONS[7]
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
    WIN_COMBINATIONS[7]
  else
    false 
  end
end

def full?(board)
  board.each do |what|
    if what == "X" || what == "O"
      true
    elsif what == " "
      return false
    else 
      true
    end
  end
end

def draw?(board)
  if board = !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if board = won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  index = [board]
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play(board)
  while over?(board) == false
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

