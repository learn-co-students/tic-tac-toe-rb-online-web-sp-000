#WIN_COMBINATIONS
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]


# display_board
board = ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)


#converts user_input to an integer
user_input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

def input_to_index(user_input)
  user_input.to_i - 1
end


#move
def move(board, user_input, char)
  board[user_input] = char
end


# postion_taken? method
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index]== nil
    false
  else board[index] == "X" || "O"
    true
  end
end


# valid_move? method
def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8) == true
    true
  else position_taken?(board, index) == true
    false
  end
end


#turn
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  user_input = input_to_index(user_input)
  char = current_player(board)
  until valid_move?(board, user_input) == true
      turn(board)
      break
    end
  if valid_move?(board, user_input)
    move(board, user_input, char)
    display_board(board)
  end
end


#turn_count
def turn_count(board)
  number_of_turns = 0
  board.each do |token|
    if token == "X" || token == "O"
    number_of_turns += 1
    end
  end
  return number_of_turns
end


#current_player
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end


#won?
def won?(board) 
	WIN_COMBINATIONS.each do |win_combo| 
		if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X" 
			return win_combo 
		elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O" 
			return win_combo
		end
	end
	false
end	

#full?
def full?(board)
  if board.include?(" ") || board.include?("")
    return false
  else
    return true
  end
end

#draw?
def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

#game over?
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

#who won?
def winner(board)
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X" 
			return "X"
		elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O" 
			return "O"
		end
	end
	nil
end


def play(board)
  until over?(board) == true
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

