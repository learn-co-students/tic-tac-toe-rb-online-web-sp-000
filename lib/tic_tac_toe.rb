
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



WIN_COMBINATIONS = [
  [0,1,2], # top row 
  [3,4,5], # middle row 
  [6,7,8], # bottom row 
  [0,3,6], # 1st column
  [1,4,7], # 2nd column 
  [2,5,8], # 3rd column
  [0,4,8], # Left-right diagonal
  [2,4,6], # right-left diagonal
  
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

def turn_count(board)
  turn_count = 0 
  board.each do |element|
  turn_count += element.count("X" + "O")
  end
return turn_count
end 

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def move(board, position, current_player)
  board[position] = current_player
end

def position_taken?(board, position)
  board[position] != " " && board[position] != ""
end

def valid_move?(board, position)
  position.between?(0,8) && !position_taken?(board, position)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  position = input_to_index(user_input)
  if valid_move?(board, position)
      move(board, position, current_player(board))
      display_board(board)
  else
     turn(board)
    
  end
   # if draw?(board)
      # puts "Cat's Game!"
    # end
end

def won?(board)
  winning_array = WIN_COMBINATIONS.detect do |win|
    if win.all? {|index|       #when block is used within if must use curly braces
        board[index] == "X"}

    winning_array.inspect
    
    elsif win.all? {|index|
            board[index] == "O"}
    
    winning_array.inspect
    
    end
  end
end

def winner(board)
  WIN_COMBINATIONS.detect do |win|
    if win.all? {|index|
      board[index] == "X"}
    return "X"
    
    elsif win.all? {|index|
      board[index] == "O"}
    return "O"
    end
  end
end

def full?(board)
  
  board.all? {|index|
    index == "X" || index == "O"}
end


def draw?(board)
 
  full?(board) && !won?(board)
end

def over?(board)
  
  draw?(board) || won?(board)
   
end
