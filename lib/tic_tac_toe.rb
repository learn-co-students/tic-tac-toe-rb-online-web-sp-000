board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def play(board)
  while !over?(board)
  turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[0])
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts "Welcome to Tic Tac Toe!"
end

def input_to_index(user_input)
  converted_input = user_input.to_i - 1
  return converted_input
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
  return false
else board[index] != " " || board[index] != ""
  return true
  end
end
 
def valid_move?(board, index)
   if index.between?(0, 8) && !position_taken?(board, index)
  return true
 else
  return false
  end
end

def full?(board)
  board.all? { |mark| mark == "X" || mark == "O" }
end
    
def draw?(board)
  if !won?(board) && full?(board)
    return true
    puts "Cat's Game!"
  elsif !won?(board) || won?(board)
  return false
end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else !won?(board) || !draw?(board)
    return false
end
end

def turn(board)
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(board, index)
     move(board, index, current_player = "X")
   display_board(board) 
   else
     turn(board)
  end
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def turn_count(board)
  counter = 0
  board.each do |index|
  if index == "X" || index == "O"
  counter += 1
  end
end
  return counter
end

def move(board, index, current_player)
  board[index] = current_player
end

def winner(board)
  if triple_combo = won?(board)
    board[triple_combo.first]
  else
    nil
  end
end