WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column 
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal 1 
  [2,4,6], # diagonal 2
  ]


def play(board)
  until over?(board) == true
  turn(board)
end
  if won?(board) != false
    puts "Congratulations #{winner(board)}!" 
  elsif draw?(board)
    puts "Cat's Game!"
  end
end




  
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
   if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" 
     return win_combination
    elsif board[win_combination[0]]== "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
     return win_combination
   else 
     false 
    end
  end
end

def full?(board)
  if board.any?{|element| element == " " } then return false
  else 
  return true
  end
end

def draw?(board)
  if (won?(board) == false && full?(board) == true)
  then return true
  end
end

def over?(board)
  if draw?(board) == true || (won?(board) != false && full?(board) == true) || (won?(board) != false && full?(board) != true) 
    then return true
  end
end
  
def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" 
      puts "X"
      return "X"
    elsif board[win_combination[0]]== "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      puts "O"
      return "O"
  end
  end
end

def turn_count(board)
  counter = 0 
  board.each do |space|
    if space != " "
    then counter += 1 
    end
  end
  return counter
end

def current_player(board)
  if (turn_count(board) % 2 == 0) then return "X"
  elsif (turn_count(board) % 2 == 1) then return "O"
  end  
end

def turn(board)
  char = current_player(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(board, index)
    move(board, index, char)
    display_board(board)
  else turn(board)
  end
end
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  return TRUE if index.between?(0,8) && (board[index] != ("X" || "O") )
end

def input_to_index(input)
  index=input.to_i
  index -= 1
end

def move(board, index, char)
  board[index] = char
end
