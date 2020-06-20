def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,4,6],
  [2,5,8]
  
  ]
  
  def won?(board)
    WIN_COMBINATIONS.any? do |win_combination| 
        
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      
      position_1= board[win_index_1]
      position_2= board[win_index_2]
      position_3= board[win_index_3]
     
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      
        return win_combination
    else
      false
    end
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
   
end
end
  
def draw?(board) 
  
  if full?(board) && !won?(board)
    true
  end
end
  
def over?(board)  
  if full?(board) || won?(board) || draw?(board)
    true
 end
end
    
def winner(board) 
 if won?(board)
  return board[won?(board)[0]]
  end
end

def turn_count(board)
  
  counter= 0
   board.each do |space|
    if space == "X" || space == "O"
  counter += 1
  puts "#{counter}"
  
end
end
counter
end

def current_player(board)
  turns= turn_count(board) % 2 
  if turns.even?
     "X"
  else
     "O"
  end
end

def valid_move?(board, index)
index.between?(0, 8) && !position_taken?(board, index)
 
end
  
 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = input.to_i - 1
end


def move(board, index, value)
  board[index]=value
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
index= input_to_index(input)
if valid_move?(board, index)
move(board, index, current_player(board))
display_board(board)
else
turn(board) 
until valid_move?(board, index)
break
turn(board)
input = gets.strip
index = input_to_index(input)

move(board, index, current_player(board))
display_board(board)
end
end
end
 
def play(board)
  until over?(board)
  turn(board)
end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
  end
end
     