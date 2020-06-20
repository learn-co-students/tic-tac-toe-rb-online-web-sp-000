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
  
    # Helper Method
  
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

def move(board, index, player)
board[index] = player 
end

def position_taken? (board, index)
  if board[index] == " " || board[index]  == "" || board[index]  == nil
    return false
  elsif board[index]  == "X" || board[index]  == "O"
    return true
  else 
  end
end

def valid_move?(board, index) 
  if position_taken?(board, index) && index.between?(0, 8) 
  elsif position_taken?(board, index)  == true && index.between?(0, 8) == false
    return false
  elsif position_taken?(board, index)  == false && index.between?(0, 8) == true
  return true
  end
end

def turn (board)
 puts "Please enter 1-9:"
 user_input = gets.strip
 index = input_to_index(user_input)
 if valid_move?(board, index)
   move(board, index,current_player(board))
   display_board(board)
 else 
   turn(board)
 end
end

  def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1 
     end
   end
   counter
  end
  
  def current_player(board)
  if turn_count(board).even? 
    return "X"
    else 
    return "O"
  end
  end 
  
  def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  board[win_combination[0]] == board[win_combination[1]] &&
  board[win_combination[1]] == board[win_combination[2]] &&
  position_taken?(board, win_combination[0])
  end
end 

def full?(board)
    board.all? {|full_board| full_board == "X" || full_board== "O" }
 end
 
def draw?(board)
   full?(board) && !won?(board)
 end
 
 def over?(board) 
  draw?(board) || won?(board)
 end
 
 def winner(board) 
   win_combination = won?(board)
   if won?(board) 
    board[win_combination[0]]
   end
 end
 
 def play(board)
   until over?(board) 
   turn (board)
   end
   if won?(board)
     puts "Congratulations #{winner(board)}!"  
   elsif draw?(board)
     puts "Cat's Game!"
   end
 end
 