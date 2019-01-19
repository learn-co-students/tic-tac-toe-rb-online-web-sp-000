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

def input_to_index(index)
  index = index.to_i - 1
end  

def move (board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  if (board[index] == " " || board[index] == "")
    return FALSE
  elsif board[index] == NIL
    return FALSE
  else 
    return TRUE
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board,index) == FALSE
    return TRUE
  end
end 

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  input = input_to_index(input)
  if valid_move?(board, input) == TRUE
    move(board, input, current_player(board))
    display_board(board)
  elsif valid_move?(board, input) != TRUE
      turn(board)
  end
end  

def turn_count(board)
  counter = 0 
  board.each do |char|
    if (char == "X" || char == "O")
      counter += 1 
    end
  end
  return counter
end

def current_player(board)
  turn = turn_count(board)
  if turn % 2 == 0 
    return "X"
  else
    return "O"
  end
end 

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_1 = win_combination[0]
    win_2 = win_combination[1]
    win_3 = win_combination[2]
      
    pos_1 = board[win_1]
    pos_2 = board[win_2]
    pos_3 = board[win_3]

  if(pos_1 == "X" && pos_2 == "X" && pos_3 == "X")
    return win_combination
  elsif(pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
    return win_combination
  end 
end
return false
end 

def full?(board)
  board.each do |pos|
    if(pos == " ")
      return false
    end  
  end  
end

def draw?(board)
  full?(board) && !won?(board) 
end
  
def over?(board)
  won?(board) || draw?(board) || full?(board)
end
  
def winner(board)
  if won?(board) == false
    return nil
  else
    win = won?(board)
    return board[win[0]]
  end  
end  

def play(board)
  until over?(board)
    current_player(board)
    turn(board)
    turn_count(board)
  end
  if won?(board)
    char = winner(board)
    puts "Congratulations #{char}!"
  elsif
    draw?(board)
    puts "Cat's Game!"
  end  
end  