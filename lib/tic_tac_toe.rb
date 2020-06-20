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
  
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(move)
  index = move.to_i - 1 
end


def move(board, index, token)
  board[index] = token
end  


def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
   false
  else board[index] == "X" || board[index] == "O"
   true
  end
end


def valid_move?(board, position)
  index = position.to_i - 1 
   if !position_taken?(board, position) && position.between?(0,8)
    true
   else
    false
   end
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player(board)
  if valid_move?(board,index)
    puts "valid move"
    move(board, index, token)
    display_board(board)
   else
    puts "try again"
    turn(board)
  end
  display_board(board)
end


def turn_count(board)
  counter = 0
  board.each do |move|
    if move == "X" || move == "O"
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


def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    location1 = win_combination[0]
    location2 = win_combination[1]
    location3 = win_combination[2]
    board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
  end
end


def full?(board)
  board.none? {|index| index == " "}
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
   token = win_combination[0]
   board[token]
  end
end
  
  
def play(board)
   until over?(board)
     puts turn(board)
   end
  if winner(board) == "X"
   puts "Congratulations X!"
  else 
    puts "Congratulations O!"
  end
  puts "Cat's Game!"
end

  
  
