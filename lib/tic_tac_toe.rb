WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)

  temp = input.to_i
  index = temp - 1
  return index
end

  def position_taken?(board, index)
    check = board[index]
    if check == " " || check == "" || check == nil
     false
    else
     true
    end
  end 
  
def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
     true
  else
     false
  end
end

def move(board,index,player_char)
  board[index] = player_char
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player_char = current_player(board)

  if valid_move?(board, index) 
    move(board, index, player_char)
    display_board(board)
  else
    turn(board)
    end
end 

def current_player(board)
 if turn_count(board).even? 
   player = "X"
 else player = "O"
 end
end

def turn_count(board)
  turns = 0
  board.each do |space|
  space == "X" || space == "O" ? turns += 1 : next
  end
  return turns
end 

def won?(board)
 WIN_COMBINATIONS.each do |i| 
 a = i[0]
 b = i[1]
 c = i[2]

 if board[a] == "X" && board[b] == "X" && board[c] == "X"
   return i
   elsif board[a] == "O" && board[b] == "O" && board[c] == "O"
   return i
 else false
  end
 end

 if full?(board) || board.all?{ |i| i == " " }
   false
 end

end

def full?(board)
  board.none?(" ")
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else false 
  end
end

def over?(board)
  if won?(board) 
    true
  elsif draw?(board) 
  true
  else 
    false 
  end
end

def winner(board)
  if !over?(board)
    return nil
  end
  index = won?(board)[0]
  space = board[index]

  if  space == "X"
     "X"
    elsif space == "O"
     "O"
  end
end 

def play(board)
  while !over?(board) do
  turn(board)
  end
  if won?(board)
    winner = winner(board)
    puts"Congratulations #{winner}!"
  end
  if draw?(board) 
    puts "Cat's Game!"
  end
  
end