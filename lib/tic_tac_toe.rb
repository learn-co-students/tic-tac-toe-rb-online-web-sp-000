WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0 
  board.each do |token|
 if token == "X" || token == "O"
   counter +=1 
 end 
 end 
 counter
 end 
 
def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X" 
  else return "O"
  end
end 

    


##won goes here 
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

 if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end 
  return false
  
end


##full method goes here 
def full?(board)
  board.all? do |index|
 index == "X"||index =="O"
end 
end 

##draw method 
def draw?(board)
  if won?(board) == false && full?(board) == true 
    return true
  else 
    return false 
  end 
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
  return true 
else return false
end 
end 


def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
    elsif board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
  
  def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end