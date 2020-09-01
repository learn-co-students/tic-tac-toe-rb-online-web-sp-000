def display_board(board)
divider = "|"
lines = "-----------"

puts " #{board[0]} #{divider} #{board[1]} #{divider} #{board[2]} "
puts "#{lines}"
puts " #{board[3]} #{divider} #{board[4]} #{divider} #{board[5]} "
puts "#{lines}"
puts " #{board[6]} #{divider} #{board[7]} #{divider} #{board[8]} "
end

def position_taken?(board, index)
  # puts display_board(board)
  # if board[index] == " "
  #   false
  # elsif board[index] == ""
  #   false 
  # elsif board[index] == nil 
  #   false 
 # elsif 
  board[index] == "X" || board[index] == "O"
   # true
end


def valid_move?(board, index)
  #binding.pry
 if !position_taken?(board, index) && index.between?(0, 8)
  
  true
else
  false
end
end

def move(board, index, token)
  board[index] = token
end

def input_to_index(user_input)
  changed_input = user_input.to_i 
  changed_input -= 1
  return changed_input
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
   move(board, index, current_player(board))
    display_board(board)
  else 
    turn(board)
    #user_input = gets.strip
  end
end

def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  while !valid_move?(board, index)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  end
   move(board, index, current_player(board)) #move is valid
    display_board(board)
  # else 
  #   turn(board)
    #user_input = gets.strip
  end

# def turn(board)
#   puts "Please enter 1-9:"
#   user_input = gets.strip
#   index = input_to_index(user_input)
#   if !valid_move?(board, index)
#   # user_input = gets.strip
#   turn(board)
#   else 
#     move(board, index, token = "X")
#     display_board(board)
#   end
# end

# def play(board)
#   player_turn = 0 
#   while player_turn < 9 
#   turn(board) 
#   player_turn += 1 
# end 
# end 


require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [0,4,8], [1,4,7], [2,4,6,], [2,5,8]]

def won?(board)
  #binding.pry
WIN_COMBINATIONS.each do |wc|
  #binding.pry
  win_index_1 = wc[0]
  win_index_2 = wc[1]
  win_index_3 = wc[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X" 
    return wc 
   end
end 
false
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [0,4,8], [1,4,7], [2,4,6,], [2,5,8]]

def won?(board)
  #binding.pry
  WIN_COMBINATIONS.each do |wc|
    #binding.pry
    win_index_1 = wc[0]
    win_index_2 = wc[1]
    win_index_3 = wc[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return wc 
     end
  end
  false
end 

def full?(board)
  board.all? do |brd|
      brd == "X" || brd == "O"
  end 
end 

def draw?(board)
  if !won?(board) && full?(board)
  return true 
  # elsif !won?(board) && !full?(board)
  # return false 
  else won?(board)
  return false 
#else 
end 
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true 
  else 
    return false 
  end
end 

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else 
    nil
end
end

def current_player(board)
  if turn_count(board) % 2 == 0
  #if board % 2 == 0 
    "X"
  else 
    "O"
  end
end

def turn_count(board)
  counter = 0 
  board.each do |brd|
    if brd == "X" || brd == "O"
    counter += 1
    brd
end
end 
counter
end 

def play(board)
    input = gets.chomp
   turn(board) until over?(board)
  #turn
#end

if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cat\'s Game!"
end
end

