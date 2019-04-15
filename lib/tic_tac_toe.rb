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

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (input)
  input = input.to_i - 1
end

def move (board, index, character)
  board[index] = character
end

def position_taken?(board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  input = input_to_index(input)
  if valid_move?(board,input)
    move(board,input,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |value|
    if value == "X" || value == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn = turn_count(board)
  turn.even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.select do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    if position_taken?(board,win_index_1) && position_taken?(board,win_index_2) && position_taken?(board,win_index_3)
      if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X") || (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
        return combo
      end
    end
  end
  return false
end

def full?(board)
  board.all? do |value|
    value == "X" || value == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    return board[winning_combo[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    token = winner(board)
    puts "Congratulations #{token}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
