#constant WIN_COMBINATIONS

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

# display board 

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# converting user input

def input_to_index(input)
  index = input.to_i - 1 
end

# move

def move(board,index,token)
  board[index] = token
end

# position taken

def position_taken?(board, index)
  if board[index] != " "
    true 
  else
    false
  end
end

# valid

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    true
  else
    false
  end
end

# turn 

def turn(board)
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)
  
  if valid_move?(board, index)
     move(board, index, token)
     display_board(board)
  else turn(board)
  end
end  

# turn count

def turn_count(board)
  counter = 0 
  board.each do |value|
    if value != " "
      counter += 1
    end
  end
  return counter
end

# current player

def current_player(board)
  if turn_count(board).even?
    return "X"
  else turn_count(board).odd?
    return "O"
  end
end 
     
# won 

def won?(board)
  
  WIN_COMBINATIONS.each do |win_combination|
    
    win_index_1 = win_combination[0] 
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2] 
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
    else if position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
    else
        false
    end
    end
  end
        false
end


# full board method
def full?(board)
  board.all? do |value|
    value == "X" || value == "O"
  end
end

# draw condition method
def draw?(board)
    if full?(board) == true && won?(board) == false
        return true 
    end
  end
  
# over condition method
# else if won?(board) != false && full?(board) == false
#     true

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
      true
  else
      false
  end
end

# winner methot
def winner(board)
  if won?(board)
    won?(board).all? do |value|
        if board[value] == "X"
                return "X"
                
        else if board[value] == "O"
                return "O"
                puts "Congratulations O!"
        end
        end
    end
  end 
    return nil
end
  
# play method

def play(board)
  until over?(board)
  turn(board)
  end
  if won?(board)
   puts "Congratulations #{winner(board)}!"
    
  else if draw?(board)
    puts "Cat's Game!"
  end
  end
end
  

  