WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  return user_input.to_i - 1
end

def move(board, index, value)
  return board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index)
  else
    turn(board)
  end
end

def turn_count(board)
  
end

def current_player(board)
  
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo_array|
      if board[win_combo_array[0]] == board[win_combo_array[1]] &&  board[win_combo_array[1]] == board[win_combo_array[2]] && position_taken?(board, win_combo_array[0])
        return win_combo_array
      end
  end
  return false
end

def full?(board)
  board.all? do |value|
    value != " "  
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board) && over?(board)
    board[won?(board)[0]]
  else
    nil
  end
end








