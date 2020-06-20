WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 4, 8], # diagnol
  [2, 4, 6], # diagnol
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index= user_input.to_i - 1
end

def move (board, index, value)
  board[index]= value
end

def position_taken?(board, location)
  board[location] != " "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  counter= 0
  board.each do |token|
  if token == "X" || token == "O"
    counter += 1
  end
end
counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else 
    "O"
  end
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

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board_location1 = win_combination[0]
    board_location2 = win_combination[1]
    board_location3 = win_combination[2]
    board[board_location1] == board[board_location2] &&
    board[board_location2] == board[board_location3] &&
    position_taken?(board, board_location1) 
    # board[board_location1] != " "
  end
end

def  full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end 

def winner(board)
 if  win_combination = won?(board)
  winning_location = win_combination[0]
  board[winning_location]
else
  nil
end
end

def play(board)
 until over?(board)
 turn(board)
 end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 else 
   puts "Cat's Game!"
 end
end