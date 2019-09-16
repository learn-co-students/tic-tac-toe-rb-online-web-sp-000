WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} " 
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} " 
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} " 
end  
  
def input_to_index(user_input)
  user_input = user_input.chomp.to_i - 1 
end
  
def move(board, index, character)
  board[index] = character 
end
  
def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil 
    return false 
  else 
    return true 
  end 
end  

def valid_move?(board, index)
  if !(position_taken?(board, index)) && index.between?(0,8)
    return true 
  else 
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]]) == "X" && (board[win_combination[1]]) == "X" && (board[win_combination[2]]) == "X" 
      return win_combination
    elsif (board[win_combination[0]]) == "O" && (board[win_combination[1]]) == "O" && (board[win_combination[2]]) == "O" 
      return win_combination
    end
  end  
  false 
end

def full?(board)
  board.any? do |spot|
    if spot == "" || spot == " " || spot == nil 
      return false
    end 
  end 
  true 
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true 
  else 
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false 
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
    else
      return "O"
    end
  end
end

def turn_count(board)
  count = 0
  board.each do |turn|
    if turn.downcase == "x" || turn.downcase == "o"
      count += 1 
    end
  end
  count
end

def current_player(board)
   if turn_count(board) % 2 == 0
      return "X"
   else 
      return "O"
   end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    #do nothing
  end
end