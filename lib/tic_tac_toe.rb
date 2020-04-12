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
  counter=0
  board.each do |spaces|
    if spaces == "X" || spaces == "O"
    counter +=1
  end
  end
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
   if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X"
     return wincombo
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O"
      return wincombo
    end
  end
  false
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
  end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

# def play(board)
#   counter=0
#   while counter < 9
#     turn(board)
#     counter +=1
#   end
# end

# def play (board)
#   input = gets.strip
#   index = input_to_index(input)
#   until over?(board) == true
#     turn(board)
#   end
# end

def play(board)
   until over?(board)
      turn(board)
   end
   if won?(board)
      winner(board) == "X" || winner(board) == "O"
      puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
      puts "Cat's Game!"
   end
end
