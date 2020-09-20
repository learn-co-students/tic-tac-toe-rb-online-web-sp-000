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



def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Player #{current_player(board)}, please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  
  until over?(board)
    turn(board)
    
  end 
  if won?(board)
    puts "Congratulations #{winner(board)}!" 
    else puts "Cat's Game!"
  end    
end  

def turn_count(board)
  count = 0
  board.each do |cell|
    if cell == "X" || cell == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board) % 2 == 0? "X":"O"
end  

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]
  
def won?(board)
  to_a = []
  if WIN_COMBINATIONS.any? do |win_index|
   if  win_index.all? { |index| board[index] == "X" } || win_index.all? { |index| board[index] == "O" }
      to_a = win_index
   end
     end
  to_a
  end
  
end  

def full?(board)
  if board.all? { |i| i != " "}
    true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end  
    
def over?(board)
  if draw?(board) || won?(board)
    true
  end
end  

def winner(board)
  if won?(board)
     win_token = won?(board)
     if board[win_token[0]] == "X"
       "X"
     else 
       "O"
     end
  end   
end  