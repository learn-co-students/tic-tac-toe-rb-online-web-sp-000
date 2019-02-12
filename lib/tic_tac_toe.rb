def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

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
  if !position_taken?(board, index) && index.between?(0,8)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip.to_i
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def input_to_index(input)
   input.to_i - 1
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
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
      puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
