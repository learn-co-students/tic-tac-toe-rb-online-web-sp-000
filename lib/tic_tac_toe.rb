WIN_COMBINATIONS = 
[
[0,1,2], #Top Row
[3,4,5], #Middle Row 
[6,7,8], #Bottom Row
[0,3,6], #First Vertical Row  
[1,4,7], #Second Vertical Row 
[2,5,8], #Third Vertical Row
[0,4,8], #Diagonal Left 
[2,4,6] #Diagonal Right
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

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  board[index]== "X" || board[index] == "O"
end

def valid_move? (board, index)
  index.between?(0, 8) && !position_taken?(board, index)
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
  end
end

def turn_count(board)
  board.count {|token| token == "X" || token == "O"}
end  

def current_player(board)
  if turn_count(board) % 2 == 0
  return "X"
  else
  return "O"
  end
end
  
def won?(board)
  WIN_COMBINATIONS.each do |winner|
    if winner.all? {|position| board[position] == "X"} || 
    winner.all? {|position| board[position] == "O"}
    return winner
    end
  end  
  return false
end

def full?(board)
  board.all? {|position| position == "X" || position == "O"}
end  

def draw?(board)
  if full?(board) == true && !won?(board) == true
    return true
  end
end  

def over?(board)
  if !won?(board) == false || draw?(board) == true
    return true
  end
end

def winner(board)
  if draw?(board) == true
    return nil
  elsif won?(board) != false
    return board[won?(board)[1]]
  end
end  

def play(board)
  until over?(board) == true
  turn(board)
end
if won?(board)
  puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
  puts "Cat's Game!"
end
end