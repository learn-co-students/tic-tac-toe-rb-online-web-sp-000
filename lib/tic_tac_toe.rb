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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, position)
  board[position] != "" && board[position] != " "
end

def valid_move?(board, position)
  !position_taken?(board, position) && position.between?(0, 8)
end

def turn_count(board)
  a = 0
  board.each do |item|
    if item == "X" || item == "O"
      a += 1
    end
  end
  a
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def full?(board)
  !board.include? " "
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")

      return win_combination
    end
  end
  return false
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |winner|
    if (board[winner[0]] == "X" && board[winner[1]] == "X" && board[winner[2]] == "X")
      return "X"
    elsif (board[winner[0]] == "O" && board[winner[1]] == "O" && board[winner[2]] == "O")
      return "O"
    end
  end
  return nil
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    turn(board)
  end
end

def play(board)
  puts "Welcome to Tic Tac Toe!"
  until over?(board)
    turn(board)
  end

  if draw?(board) == false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
