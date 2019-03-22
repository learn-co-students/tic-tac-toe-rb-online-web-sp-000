WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won? (board)
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]]== "X") || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
      return win_combo
    end
  end
  false
end

def full? (board)
  counter = 0
  full =  0
  9.times do
    if board[counter] == "X" || board[counter] == "O"
      full += 1
    end
    counter += 1
  end
  if full == 9
    true
  else
    false
  end
end


def over? (board)
  if full?(board) || won?(board)
    return true
  end
  false
end

def winner (board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

def draw? (board)
  if !(won?(board)) && full?(board)
    return true
  end
  false
end

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

def move(board, index, player)
  board[index] = player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player(board)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  if turn_count(board)%2 == 0
    return "X"
  else
    return "O"
  end
end

def turn_count (board)
  xs = 0
  os = 0
  counter = 0
  9.times do
    if board[counter] == "X"
      xs +=1
    elsif board[counter] == "O"
      os +=1
    end
    counter +=1
  end
  return xs+os
end


def play(board)
  counter = 0
  while counter < 9
    if won?(board) && winner(board) == "X"
      puts "Congratulations X!"
      break
    elsif won?(board) && winner(board) == "O"
      puts "Congratulations O!"
    elsif draw?(board)
      puts "Cat's Game!"
      break
    else
      turn(board)
      counter+=1
    end
  end
end
