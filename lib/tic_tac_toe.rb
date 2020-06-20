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

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  !(position_taken?(board, index)) && index.between?(0, 8)
end

def turn(board)
  puts "Enter a position(1-9):"
  input = gets.strip
  index = input_to_index(input)
  until valid_move?(board, index)
    puts "Enter a position(1-9):"
    input = gets.strip
    index = input_to_index(input)
  end
  move(board, index, "X")
end

def turn_count(board)
  count = 0
  board.each do |value|
    if value == "X" || value == "O"
      count += 1
    end
  
  end
  return count
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    index1 = combination[0]
    index2 = combination[1]
    index3 = combination[2]
    
    if (board[index1] == "X" && board[index2] == "X" && board[index3] == "X") || (board[index1] == "O" && board[index2] == "O" && board[index3] == "O")
      return combination
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
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  combination = won?(board)
  
  if combination == false
    return nil
  end
  
  index = combination[0]
  if board[index] == "X"
    return "X"
  elsif board[index] == "O"
    return "O"
  end
end

def  play(board)
  until over?(board)
    index = 20
    until valid_move?(board, index)
      puts "Please enter position(1-9):"
      input = gets.strip
      index = input_to_index(input)

    end
    move(board, index, current_player(board))
    display_board(board)
  end
  
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end