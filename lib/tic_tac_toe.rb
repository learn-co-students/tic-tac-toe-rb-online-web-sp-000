WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 4, 8], 
  [2, 4, 6], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8]
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

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    true
  end 
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
  end
end
  turns
end
  
def move(board, position, player_token)
  board[position] = player_token
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
if valid_move?(board, index) == true
  move(board, index, current_player(board))
    display_board(board)
  else 
    puts "invalid"
turn(board)
end


def won?(board)
WIN_COMBINATIONS.each do |win_combo| 
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]

    element_1 = board[index_1]
    element_2 = board[index_2]
    element_3 = board[index_3]
    
    if element_1 == "X" && element_2 == "X" && element_3 == "X" || element_1 == "O" && element_2 == "O" && element_3 == "O"
      return win_combo
   end
end
  board.any? == "X" || board.any? == "O"
end
  
def full?(board)
  board.all? {|element|element == "X" || element == "O"}
end

def draw?(board)
!won?(board) && full?(board) 
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
 win_combo = won?(board) 
 if win_combo
   return board[win_combo[0]] 
 else
   return nil
  end
 end
   
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations   !! You Win!"
  elsif draw?(board)
    puts "Cat's Game"
  end
end
