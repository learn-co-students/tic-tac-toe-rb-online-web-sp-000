WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal top left to bottom right
  [2,4,6]  #diagonal top right to bottom left
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

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end
#if position is free, the meth will return FALSE (ie "not taken")
#otherwise, will return true

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
  counter = 0
 board.each do |element|
   if element == "X" || element == "O"
     counter += 1
   end
 end
 counter
end
#number of turns played


def current_player(board)
  if turn_count(board)%2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |combo_element|
   board[combo_element[0]] == board[combo_element[1]] &&
   board[combo_element[1]] == board[combo_element[2]] &&
   position_taken?(board, combo_element[0])
 end
end

def full?(board)
  board.all? do |letter|
    letter == "X" || letter == "O"
  end
end
#simply return false if there is an available position and
#true if there is not

def draw?(board)
   full?(board) && !won?(board)
end
#return true if board full, but not won

def over?(board)
  full?(board) || draw?(board) || won?(board)
end
#true if wone, draw or full

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
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
