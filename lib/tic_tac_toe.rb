WIN_COMBINATIONS =[
  [0,1,2], [3,4,5], [6,7,8], [0,3,6],
  [1,4,7], [2,5,8], [0,4,8], [2,4,6]]



board = [" "," "," "," "," "," "," "," "," "]



def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts          "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts          "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



def input_to_index(user_input)
   user_input.to_i - 1
end



def move(board, index, token )
       board[index] = token
end



def valid_move?(board, index)
   valid = false
  if index.between?(0, 8) && !position_taken?(board, index)
    valid = true
  end
  return valid
end


def position_taken?(board, index)
  taken = true
    if board[index] == " " || board[index]==""|| board[index]== nil
      taken = false
    end
  return taken
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index)
    move(board, index, current_player(board) )
    move(board, index, token = "X")
    display_board(board)
  else
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  end
end


def turn_count(board)
  counter = 0
    board.each do |x|
      if x == "X" || x == "O"
        counter += 1
      end
    end
  return counter
end


def current_player(board)
  counter2 = turn_count(board)
    if counter2 % 2 == 0
      return "X"
    else
      return "O"
    end
end


def won?(board)
  win = false
    WIN_COMBINATIONS.each do |win_combination|
      if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
        win = true
      elsif
        board == [" "," "," "," "," "," "," "," "," "]
        return false
      end
    end
   return win
end



def full?(board)
  full  = false
   counter3 = turn_count(board)
   if counter3 == 8
     full = true
   end
end





 def draw?(board)
   drew = false
   if !won?(board) && full?(board)
     drew = true
     print "Cat's Game!"
   end
   return drew
end


def over?(board)
  over = false
  if won?(board) || full?(board) || draw?(board)
    over = true
  end
  return over
end


def winner(board)
  win = nil
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      win = "X"
    elsif  board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      win = "O"
    end
  end
  return win
end







def play(board)
  until over?(board)
    turn(board)
  end
    if won?(board)
      puts  "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts  "Cat's Game!"
    end
  end
end
