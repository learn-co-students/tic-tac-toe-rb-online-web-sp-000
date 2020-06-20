WIN_COMBINATIONS = [[0,1,2],[0,4,8], [0, 3, 6], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [6,7,8]]
def display_board(board)
  ii= 0 
  while(true)
  puts " #{board[ii]} | #{board[ii+1]} | #{board[ii+2]} "
  ii+=3
  if (ii == 9)
    break
  end 
  puts "-----------"
  end
end 
def input_to_index(input)
  index= input.to_i - 1 
end
def move(board, index, player_value)
  board[index]= player_value
end
def position_taken?(board, index)
  position = board[index]
  if (position == " ")
    return false 
  else 
    return true 
  end 
end 
def valid_move?(board, index)
  if index > 8 || index < 0 
    return false 
  elsif position_taken?(board, index)
    return false 
  else 
    return true 
  end
end
def turn(board)
  
while(true)
player=current_player(board)
 puts(" please make a move 1-9 player #{player}")
  move_selected= gets.chomp 
  move_index = input_to_index(move_selected) 
  if (valid_move?(board, move_index)== false)
    puts "invalid move please make another move"
  else 
    player= current_player(board)
    move(board,move_index,player)
    display_board(board)
    break
  end
  end
end 

def turn_count(board)
  turn_count =9 
  ii = 0 
  while(ii<9)
  if (board[ii]== " ")
    turn_count -= 1
  end 
  ii+=1
  end
  return turn_count
end 

def current_player(board)
  turns=turn_count(board)
  player_turn_num= turns%2 
  if(player_turn_num==0)
    return "X"
  else 
    return "O"
  end
end 

def won?(board)
  ii = 0 
  
  while(ii<8)
    win_attempt = WIN_COMBINATIONS[ii]
    value=board[win_attempt[0]]
    if (value==" ")
      ii+=1 
    elsif (board[win_attempt[0]]==board[win_attempt[1]] && board[win_attempt[1]] == board[win_attempt[2]])
      return win_attempt
    else 
      ii+=1
    end 
  end 
  return false
end 
def full?(board) 
  ii=0 
  while(ii<8)
  if (board[ii]==" ")
    return false 
  end
  ii+=1
  end 
  return true 
end 

def draw?(board)
  if (full?(board) == false) 
    return false 
   
  elsif (won?(board)== false)
    return true
  else 
    return false 
  end
end

def over?(board)
  if (draw?(board))
    return true 
  elsif (won?(board))
    return true 
  end
  return false 
end 

def winner(board)
  way_won=won?(board)
 
  if(way_won==false)
    return nil 
  end 
   win_location=way_won[0]
  value_won = board[win_location]
  return value_won
end 
def play(board)
  while(over?(board)==false)
  turn(board)
  if (won?(board))
    break
  end 
  end
 condition_ended=winner(board)
 if(condition_ended==nil)
   puts "Cat's Game!"
 
 else 
   puts "Congratulations #{condition_ended}!"
 end
end 