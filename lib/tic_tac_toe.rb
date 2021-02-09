
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
 
]
# returns the winning combination if the board has been won
def won?(board)
 # Check if board is empty. Skip all if it is
 is_empty = board.all? do |cell|
  if cell == " "
      true
    else
      false
    end
  end 
  
  if is_empty == false 
    
    # Iterate through winning combos  
    WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
      if (position_taken?(board,win_index_1) && position_taken?(board,win_index_2) && position_taken?(board,win_index_3))
       
        positions = [board[win_index_1], board[win_index_2], board[win_index_3]]
        
        all_x = positions.all? do |position|
          if position == "X"
            true
          else
            false
          end
        end 
        
        all_o = positions.all? do |position|
          if position == "O"
            true
          else
            false
          end
        end 
        
        # return winning combo if all the pieces match
        if all_x || all_o
          return win_combo
        end
      end
    end
    
    # If no winning combo, return false (for draw)
    is_draw = board.none? do |cell|
      if cell == " "
          true
        else
          false
        end
      end
      
    if is_draw
      return false
    end
  else
    return false
  end
end

# returns true if the board is full regardless of winning
def full?(board)
  is_full = board.none? do |cell|
  
  if cell == " "
      true
    else
      false
    end
  end 
  
  return is_full
end
 
# returns true if board is full but has not been won
def draw? (board)
   is_full = full?(board)
   is_won = won?(board)
   
   if is_full == true && is_won == false
     return true
   else
     return false
   end
end
 
# returns true if the board has been won, is a draw, or is full
def over? (board)
   is_full = full?(board)
   is_won = won?(board)
   is_draw = draw?(board)
   
   if is_full || is_won || is_draw
     return true
   else
     return false
   end
end

# return winner 
def winner(board)
   if (over?(board) == false)
     return nil
   else
     win_combo = won?(board)
     
     all_x = win_combo.all? do |cell|
          if board[cell] == "X"
            true
          else
            false
          end
      end 
      
      if all_x
        return "X"
      else
        return "O"
      end
   end
end

# return board graphic
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# convert input to board index
def input_to_index(user_input)
  user_input.to_i - 1
end

# place input on board
def move(board, index, player)
  board[index] = player
end

# check if position is already taken
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# check if the move is valid
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# returns number of turns
def turn_count(board)
  counter = 0;
  
  board.each {|spot|
    if spot == "X" || spot == "O"
      counter += 1
    end
  }
  return counter
end

# calculate which players turn it is based on turn count being even or od
def current_player(board)
  turn = turn_count(board)
  
  if turn % 2 == 0 
    return "X"
  else
    return "O"
  end
end

# execute turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(board,index)
    
    move(board,index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  
  until over?(board)
    turn(board)
  end
  
  if draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
      puts "Congratulations #{winner(board)}!"
  end

end