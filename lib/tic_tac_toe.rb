board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0,1,2], # Top row 
  [3,4,5], # Middle row 
  [6,7,8], # Bottom row 
  [0,3,6], # left column 
  [1,4,7], # middle column 
  [2,5,8], # right column 
  [0,4,8], # diag topleft 
  [2,4,6]  # diag botleft
 ]
 
 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end 

def move(board, index, players_character)
  board[index] = players_character
end

def position_taken?(board, index)
 if board[index] == " " || board[index] == "" || board[index] == nil
   false
 else
   true
 end
end

def valid_move?(board, index)
  def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
       false
    else
      true
    end
  end
  
  def on_board?(num)
    if num.between?(0, 8) == true
      true
    else
      false
    end
  end

  if (position_taken?(board, index)) == false && (on_board?(index) == true)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input) 
  if valid_move?(board, index) == false 
    puts "Invalid move."
    turn(board)
  else
    move(board, index, players_character = current_player(board))
    display_board(board)
  end
end

def turn_count(board)
  turns = 0 
  board.each do |move|
    if move == "X" || move == "O"
      turns += 1 
    end 
  end
  turns
end 

def current_player(board)
  turns = turn_count(board)
  turns % 2 == 0? "X" : "O"
end 

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
      if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
       return win_combo 
      end
  end
  false
end

def full?(board)
  !board.any?{|x| x == " "}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end 

def winner(board)
  winning_combo = won?(board)
  if winning_combo
   board[winning_combo[0]]
  else 
   nil
  end
end

def play(board)
  until over?(board) 
      turn(board)
   end 
   if won?(board)
      winner(board) == "X" || winner(board) == "O" 
      puts "Congratulations #{winner(board)}!" 
   elsif draw?(board)
      puts "Cat's Game!" 
   end 
end