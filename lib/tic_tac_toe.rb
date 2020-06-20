WIN_COMBINATIONS = [
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

def input_to_index(input) 
  input.to_i - 1 
end

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else 
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9"
  input = gets.strip
  input_to_index(input)
  index = input_to_index(input)
  if !valid_move?(board, index)
     turn(board)
    else
    move(board, index, current_player(board))
  end
  display_board(board)
end
  
def turn_count(board)
  count = 0 
  board.each do |board|
   if board != " "  
    count += 1
  end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else
    return "O"
  end
end
  
def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      
    if win_combination.all?{|symbol| board[symbol] == "X"}
      return win_combination
    elsif win_combination.all?{|symbol| board[symbol] == "O"}
      return win_combination
    end
    end
    return false
  end
  
  def full?(board)
    board.all? do |taken|
      taken == "X" || taken == "O"
 end
end    

def draw?(board)
 !won?(board) && full?(board)
 end
 
 def over?(board)
   draw?(board) || won?(board) 
 end 
 
 def winner(board)
   if draw?(board) || !full?(board) && !won?(board)
     return nil
   elsif board[won?(board)[0]] == "X"
   return "X"
   elsif board[won?(board)[0]] == "O"
   return "O"
   end
 end
  
def play(board)
  while !over?(board) && !won?(board) && !draw?(board)
  turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    end
    if draw?(board)
      puts "Cat's Game!"
    end
end