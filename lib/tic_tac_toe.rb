WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def won?(board)
  for win_combination in WIN_COMBINATIONS
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end 
  end 
  false 
end 

def full?(board)
!board.include?(" ")
end   

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def input_to_index(user_input)
  user_input.to_i - 1
end


def turn(board) 
  puts "Please enter 1-9:"
  user_input = gets.chomp 
  index = input_to_index(user_input)
  if valid_move?(board, index) 
    token = current_player(board)
    move(board, index, token) 
    display_board(board)
  else 
    turn(board) 
  end   
end   

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
end

def turn_count(board)
  counter = 0
  board.each do |element|  
  if element == "X" || element == "O" 
    counter += 1
  end 
  end
  counter 
end 

def move(board,index,token) 
  board[index] = token 
end 

def winner(board)
  win_combination = won?(board)
  if win_combination 
    index = win_combination[0]
    board[index]
  else 
    nil  
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



