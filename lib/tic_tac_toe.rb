WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #middle row
  [6,7,8], #bottom row 
  [0,4,8], #diag 1 
  [2,4,6], #diag 2 
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  ]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 


def input_to_index(user_input)
  index = user_input.to_i - 1
end


def move(board, index, player)
  board[index] = player
end

def valid_move?(board,index)
  index.to_i 
  if !position_taken?(board,index) && index.between?(0,8)
    return true 
  else return false 
  end
end


def position_taken?(board, index)
  if board[index] == "X"
    return true
  elsif board[index]  == "O"
    return true
else board[index] == false
  end
end


def turn_count(board)
  counter = 0
  board.each do |spot| 
    if spot == "X" || spot =="O"
    counter += 1 
    end
  end 
 return counter 
end


def current_player(board)
  counter = turn_count(board)
  if counter % 2 == 0 
    return "X"
  else return "O" 
  end
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player =  current_player(board)
    move(board, index, player) 
    display_board(board)
  else
    return turn(board)
  end
end


  def won?(board) 
    WIN_COMBINATIONS.each do |win_combination| 
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      if ((position_1 == "X" && position_2 == "X" && position_3 == "X")  || (position_1 == "O" && position_2 == "O" && position_3 == "O")) 
        return win_combination
      else
      end 
    end 
   return false 
  end
  
  
  def full?(board)
    if board.all? {|index| index == "X" || index == "O"}  
      return true 
    else return false
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  else return false
 end
end


def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return true
  else return false
 end
end 


def winner(board)
 index = []
 index = won?(board)
  if index == false
    return nil 
  else 
    if board[index[0]] == "X"
      return "X"
  else return "O"
  end 
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


  
  
  
