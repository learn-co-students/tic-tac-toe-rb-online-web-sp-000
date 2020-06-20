WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]
  
def display_board(board)
  puts (" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts ("-----------")
  puts (" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts ("-----------")
  puts (" #{board[6]} | #{board[7]} | #{board[8]} ")
end

def input_to_index(integer)
  integer.to_i - 1
end

def move(board, position, player_token)
  update_array_at_with(board, position, player_token)
end

def update_array_at_with(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  if (board[index] ==  " " || board[index] == "" || board[index] == nil)
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !(position_taken?(board, index))
    true
  end
end

def turn(board)
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   character = current_player(board)
   if valid_move?(board, index)
    move(board, index, character)
  else
    puts "try again"
    turn(board)
  end
  display_board(board)
end

def play(board)
   until over?(board) 
      turn(board)
   end
   if won?(board)
      winner(board) == "X" || winner(board) == "O" 
      puts "Congratulations #{winner(board)}!" 
   else draw?(board)
      puts "Cat's Game!"
   end
end

def turn_count(turn)
  move_count = []
  turn.each do |unit|
    if unit == "X" || unit == "O"
      move_count.push(1)
    end 
  end 
  move_count.length.to_i
end 
 
def current_player(board)
    num = turn_count(board)
    if num % 2 == 0
      return "X"
    else
      return "O" 
    end 
end 

def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
    if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X"
      return wincombo
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O" 
      return wincombo 
  end 
end 
false 
end

def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
   if !won?(board) && full?(board)
     true
   elsif won?(board) && full?(board)
     false
   else won?(board) && !full?(board)
     false
   end
end

def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
    else
      false
   end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else !won?(board)
    return nil
  end
end

