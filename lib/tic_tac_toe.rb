WIN_COMBINATIONS = [
  [0,1,2], #Top row
	[3,4,5], #Mid Row
	[6,7,8], #Bot Row
	[0,3,6], #1st Col
	[1,4,7], #2nd Col
	[2,5,8], #3rd Col
	[0,4,8], #top corner cross
	[6,4,2]  #bottom corner cross 
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 
def input_to_index(input)
  input = input.to_i 
 input -= 1
end 

def move(board, index, crrentplayer)
  board[index] = crrentplayer
end

def position_taken?(board, position)
  if board[position] == " " || board[position] == nil || board[position] == ""
    return false
  elsif 
    board[position] == "X" || board[position] == "O"
    return true
  end
end

def valid_move?(board, input)
  if input.between?(0,8) && !position_taken?(board, input)
    return true 
  else
    return false
  end
end

def turn_count(board)
  counter = 0 
  board.each do |supervar|
   if supervar == "X" || supervar == "O"
  counter = counter + 1
end 
end 
return counter
end
  
def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else
    return "O"
  end 
end 

def turn(board)
  puts "pick a position 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else 
    turn(board)
  end 
end 

def won?(board)
  WIN_COMBINATIONS.each do |wombocombo|
    win_index_1 = wombocombo[0]
    win_index_2 = wombocombo[1]
    win_index_3 = wombocombo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
   
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return wombocombo
    end
  end
  return false
end

def full?(board)
  if board.any? {|index| index == nil || index == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || 
    won?(board) == true ||
    full?(board) == true 
    return true 
  else 
    return false 
  end 
end 

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
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
