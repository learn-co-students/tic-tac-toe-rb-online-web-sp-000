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
  
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


def display_board(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(number)
 number.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board [index] == nil
    FALSE
  else
    TRUE
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && board[index] != "X" && board[index] != "O"
    TRUE
  else
    FALSE
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  elsif turn_count(board) % 2 != 0 
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(board, index) == TRUE
    value = "X" || value == "O"
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
  
   if won?(board)
      winner(board) == "X" || winner(board) == "O" 
      puts "Congratulations #{winner(board)}!" 
   elsif draw?(board)
      puts "Cat's Game!"
  end
end

def update_array_at_with(array, index, value)
  array[index] = value
end
  
def turn_count(board)
  counter = 0 
   board.each do |token|
     if token == "X" || token == "O"
    counter += 1 
   end
  end
 counter
end
  
def won?(board)
 WIN_COMBINATIONS.detect do |win_combination|
   combo1 = win_combination[0]
   combo2 = win_combination[1]
   combo3 = win_combination[2]
  board[combo1] == board[combo2] && board[combo2] == board[combo3] && board[combo1] != " "
 end
end
  
def full?(board)
  board.none? {|space| space == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board) 
  if win_combination
   winning_location = win_combination[0]
   board[winning_location]
  end
end

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
