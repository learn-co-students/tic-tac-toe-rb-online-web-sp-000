WIN_COMBINATIONS =
  [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
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

def move(board, user_input, value)
  board[user_input.to_i] = value
end

def position_taken?(board, user_input)
  if board[user_input] == " " || board[user_input] == "" || board[user_input] == nil
    false
  else true
end
end

def valid_move?(board, user_input)
  user_input.between?(0,8) && !position_taken?(board, user_input)
end

def turn(board)
  puts "Please enter 1-9:"
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
 counter = 0 #counter at 0
    board.each do |space| #check array starting at 0
      if space == "X" || space == "O" #if space is taken
      counter += 1 #then count one more
    end
  end
  counter
end  

def current_player(board)
    if turn_count(board).even?
       "X"
    else 
       "O"
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
          

    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
        return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end
  
def full?(board)
  board.all? do |position|
  position == "X" || position == "O" 
end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  over?(board) #make sure it's over
  if won?(board) #see if anyone won, return that array
    index = won?(board)[0] #index = first unit of winning array
    board[index] #retrieve value of that first unit
  elsif false  
end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "congrats {"
  elsif draw?(board)
    puts "cats game"
  end
end



 
 
  #allows turns
  #checks if game is over after each turns
  #if game is over due to winning or draw, congratulates winner