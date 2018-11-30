# the combinations
WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6 ,7 ,8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0,4, 8],[2, 4, 6]]

# display the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#change user input
def input_to_index(user_input)
  return user_input.to_i - 1
end

#make the move
def move(board, index, current_player)
  board[index] = current_player
  
end

#check if filled
def position_taken?(board, index)
  occupied = nil
  if (board[index] == " " || board[index] == "" || board[index] == nil)
      occupied = false
    else
      occupied = true
      
    end
    occupied
  end
  
# validate the move
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

#ask for a move, take a turn 
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

#count the number of turns
def turn_count(board)
  count_moves = 0 
  board.each do |check|
    if (check == "X" || check == "O")
        count_moves += 1 
    end
  end
   return count_moves
end

#current player  
 def current_player(board)
  turn_count(board)
  if turn_count(board).even? 
    return "X"
  else
    return "O"
    
  end
end 

#Define a win 
def won?(board)
WIN_COMBINATIONS.each do |win_combination|
  win_index0 = win_combination[0]
  win_index1 = win_combination[1]
  win_index2 = win_combination[2]
 
  position_1 = board[win_index0]
  position_2 = board[win_index1]
  position_3 = board[win_index2]

if (position_1 == "X" && position_2 == "X" && position_3 == "X")
  return win_combination
  elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
  return win_combination
end
end
return false
end

# Is the board full?
def full?(board)
    board.all? do |marker|
      marker == "X" || marker == "O"
    end
  end
  
# Was there a draw?
def draw?(board)
  
  full?(board) && !won?(board)
   
  # if won?(board) == true
  #   return false
  # elsif won?(board) == false && full?(board) == true
  #   return true
  # elsif !won?(board) && !full?(board)
  #   return false




end

#Is the game over?
def over?(board)
    if draw?(board)
      return true
      
    elsif won?(board) && full?(board)
    return true
    
    elsif won?(board) && !full?(board)
      return true
      
    elsif !(won?(board) && full?(board))
      return false
    end  
end

#The winner Is
def winner(board)
  if win_combo = won?(board)
  board[win_combo.first]
#else
 # return nil
end
 end

#play method 
def play(board)
  until over?(board)
    turn(board)
  end
  winner = winner(board)
  if won?board
   puts "Congratulations #{winner}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end

  
#   moves = 0 
#   until moves == 9 
#   turn(board)
#   moves += 1 
# end
end
