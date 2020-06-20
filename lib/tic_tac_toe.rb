WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board_array)
	lines = "-----------"
		puts " #{board_array[0]} | #{board_array[1]} | #{board_array[2]} "
		puts lines
		puts " #{board_array[3]} | #{board_array[4]} | #{board_array[5]} "
		puts lines
		puts " #{board_array[6]} | #{board_array[7]} | #{board_array[8]} "
end

def input_to_index(choice)
  return choice.to_i - 1
end

def get_user_input
  message = "Please enter 1-9:"
  puts message
  input = gets.strip.chomp
  return input_to_index(input)
end

def move(board, index, letter)
	return board[index] = letter.upcase
end

def valid_move?(board, index)	
	if !position_taken?(board, index) && (0..8).cover?(index)
		return true
	else
		return nil
	end
end

def position_taken?(board, index)
	if board[index] == " " || board[index] == "" || board[index] == nil
		return false
	else
		return true
	end
end

def turn(board)
  index = get_user_input      
  loop do
    if(valid_move?(board, index))
      move(board, index, current_player(board))
      display_board(board)
      break
    else
      index = get_user_input
    end
  end
end

def turn_count(board)
  turn_number = 0
  board.each do |letter|
    turn_number += 1 if letter == "X" || letter == "O" 
  end
 return turn_number
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

#********************************************************
def won?(board)
  WIN_COMBINATIONS.each do |combo|
     if winner = x_wins?(combo, board) || o_wins?(combo, board)
      return combo
     end
  end
  return nil
end

#return true if all x's combination win
def x_wins?(combo, board)
  if combo.nil?
    return nil
  else
  combo.all?{|index_combo| board[index_combo.to_i] == "X"}
  end 
end

#return true if all o's combination win
def o_wins?(combo, board)
  if combo.nil?
    return nil
  else
  combo.all?{|index_combo| board[index_combo.to_i] == "O"}  
  end
end

def full?(board)
  board.all?{|element| element != " " && element != "" && element != nil }
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return nil
  end
end

def over?(board)
  return true if draw?(board) || won?(board) && full?(board) || won?(board) && !full?(board)
end

def winner(board)
   if x_wins?(won?(board), board) 
    return "X"
   elsif o_wins?(won?(board), board)
    return "O"
   else
    return won?(board)
   end
end

def play(board)
  until over?(board)
    turn(board)
  end
    if !draw?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cat's Game!"
    end
end


