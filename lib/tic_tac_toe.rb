WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  ]
  
def display_board(b)
  puts " #{b[0]} | #{b[1]} | #{b[2]} "
  puts "-----------"
  puts " #{b[3]} | #{b[4]} | #{b[5]} "
  puts "-----------"
  puts " #{b[6]} | #{b[7]} | #{b[8]} "
end


def input_to_index(user_input)
user_input.to_i - 1
end

def move(board, index, character)
board[index] = character
end

def valid_move?(board, index)
 if index >= 0 && index <= 8 && !position_taken?(board, index)
   true 
 else 
   false 
 end 
 end 

def position_taken?(board, index)
 if board[index] == " " || board[index] == "" || board[index] == nil
   false
 else board[index] == "X" || board[index] == "O"
   true
 end
end



def turn_count(placeholderBoard)
  totalXsOs = 0 
  placeholderBoard.each do |playerspace|
    if playerspace == "X" || playerspace == "O"
      totalXsOs += 1 
       end
  end  
    
  totalXsOs   
end
 
  def current_player(board)
    if turn_count(board) % 2 == 0 
      "X"
   else
      "O"
    end
  end 


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) 
    move(board, index, current_player(board))
 else
   turn(board)
 end
 display_board(board)
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    
    index1 = combo[0]
    index2 = combo[1]
    index3 = combo[2]


   space1 = board[index1]
   space2 = board[index2]
   space3 = board[index3]
   
   if space1 == "X"  && space2 == "X" && space3 == "X"
     return combo 
   elsif space1 == "O"  && space2 == "O" && space3 == "O"
     return combo
   end
  end 
  return false
end

def full?(board)
  !board.any? do |space|
    space == " "
    
    end
  end


   
def draw?(board)
   full?(board) && !won?(board) 
  end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  combo = won?(board)
  if combo 
    index1 = combo[0]
    space1 = board[index1]
    return space1
  end
end


def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
    puts "Cat's Game!"
  
  end
end























