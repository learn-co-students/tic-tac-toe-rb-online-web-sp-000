
WIN_COMBINATIONS = [
  [0, 1, 2], #top_row_win
  [3, 4, 5], #middle_row_win
  [6, 7, 8], #bottom_row_win
  [0, 3, 6], #left_colum_win
  [1, 4, 7], #middle_colum_win
  [2, 5, 8], #right_colum_win
  [0, 4, 8], #diagonal_l_to_r_win
  [2, 4, 6] #diagonal_r_to_l_win

]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

#input_to_index
def input_to_index(user_input)
user_input.to_i-1
end

#move
def move(board, index, player)
board[index] = player
end

#position_taken?
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#valid_move?
def valid_move?(board, index)
  if index.to_i.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    false
  end
end

#turn_count
def turn_count(board)
  counter = 0
  board.each {|space|
    if space == "X" || space == "O"
      counter += 1
    end
  }
  counter
end

#current_player
def current_player(board)
turn_count(board) % 2 == 0?
"X" : "O"
end

#turn
def turn(board)
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(board, index)
      return move(board, index, current_player(board))
      turn(board)
    else
      turn(board)
   display_board(board)
 end
end

#won?
def won?(board)
WIN_COMBINATIONS.each do |single_win_combo|
  win_index_1 = single_win_combo[0]
  win_index_2 = single_win_combo[1]
  win_index_3 = single_win_combo[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    return single_win_combo
  end
end
return false
end

#full?
def full?(board)
  if board.any? {|index| index == " " || index == nil}
    return false
  else
    return true
  end
end

#draw?
def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif won?(board) && full?(board)
    return false
  else won?(board)
    return false
  end
end

#over?
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

#winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

#play

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
