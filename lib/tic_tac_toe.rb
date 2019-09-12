WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
]

def display_board(board)
  separator = "|"
  lines = "-----------"

  puts " #{board[0]} #{separator} #{board[1]} #{separator} #{board[2]} "
  puts "#{lines}"
  puts " #{board[3]} #{separator} #{board[4]} #{separator} #{board[5]} "
  puts "#{lines}"
  puts " #{board[6]} #{separator} #{board[7]} #{separator} #{board[8]} "
end

def input_to_index(user_input)
  converted_input = user_input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8) #|| board[index] == nil
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip.chomp
  index = input_to_index(user_input)
  until valid_move?(board, index)
    puts "Please enter 1-9:"
    user_input = gets.strip.chomp
    index = input_to_index(user_input)
  end
  value = current_player(board)
  move(board, index, value)
  display_board(board)
end

def turn_count(board)
    counter = 0
    board.each do |character|
          if character == "X" || character == "O"
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
