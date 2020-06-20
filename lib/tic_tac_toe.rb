 WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
 def display_board (board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(user_input)
 user_input.to_i - 1
end
def move(board,position,player)
  board[position] = player
end

def position_taken?(board,index)
   if (board[index] == "" || board[index] == " " || board[index] == nil)
        false
    else
        true
    end
end


def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board, index)
end
def turn(board)
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
counter = 0    
board.each do |position|
    if (position == "X" || position == "O")
		counter+=1 
    
    end
end
    counter
  end
def current_player(board)
 if turn_count(board)  % 2 != 0
   "O"
 else 
   "X"
end
end
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all?{ |i| board[i] == "X"} || win_combo.all?{ |i| board[i] == "O"}
     return win_combo
    end
  end
  false
end
def full?(board)
  board.all?{|v| v== "X" || v == "O"}
end
def draw?(board)
  full?(board)&& !won?(board)
end
def over?(board)
  won?(board) || draw?(board) || full?(board)
end
def winner(board)
  if win_combo = won?(board)
    winner = board[win_combo.first]
  end
  winner
end
def play(board)
   turn(board) until over?(board)
  if won?(board)
    puts  "Congratulations #{winner(board)}!"
  else  draw?(board)
    puts "Cat's Game!"
 
  end
end
