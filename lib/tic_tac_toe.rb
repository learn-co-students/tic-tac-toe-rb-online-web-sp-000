WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn_number = 0
  board.each do |turn| 
    if turn != " "
      turn_number += 1
    end
  end
  return turn_number
end


def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end



def won?(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X" || board[0] == "O" && board[1] == "O" && board[2] == "O"
    return WIN_COMBINATIONS[0]
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X" || board[3] == "O" && board[4] == "O" && board[5] == "O"
    return WIN_COMBINATIONS[1]
  elsif board[6] == "X" && board[7] == "X" && board[8] == "X" || board[6] == "O" && board[7] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[2]
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X" || board[0] == "O" && board[3] == "O" && board[6] == "O"
    return WIN_COMBINATIONS[3]
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X" || board[1] == "O" && board[4] == "O" && board[7] == "O"
    return WIN_COMBINATIONS[4]
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X" || board[2] == "O" && board[5] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[5]
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X" || board[0] == "O" && board[4] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[6]
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X" || board[2] == "O" && board[4] == "O" && board[6] == "O"
    return WIN_COMBINATIONS[7]
  else
    return false
  end
end

def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == true && full?(board) == true
    return false
  elsif won?(board) == true && full?(board) == false
    return false
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    return true
  end
end

def winner(board)
  if won?(board) == false
    return nil
  end
  winning_array = won?(board)
  winning_array_int = winning_array[0].to_i
  if board[winning_array_int] == "X"
    return "X"
  elsif board[winning_array_int] == "O"
    return "O"
  else
    return nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end