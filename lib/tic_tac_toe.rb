# Helper Methods
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

def turn_count(board)
  turns = 0
  board.each do |x|
    if x == "X" || x== "O"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    symbol = current_player(board)
    move(board, index, symbol)
    display_board(board)
  else
    turn(board)
  end
end

WIN_COMBINATIONS =[ [0,1,2] , [3,4,5] , [6,7,8] , [0,3,6] , [1,4,7] , [2,5,8] , [0,4,8] , [2,4,6] ]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    index = x[0]
    index1 = x[1]
    index2 = x[2]

    position_1 = board[index]
    position_2 = board[index1]
    position_3 = board[index2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return x
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return x
    end
  end
  return false
end

def full?(board)
  board.all? do |index|
     index == "X" || index == "O"
   end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  else
    return "O"
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
