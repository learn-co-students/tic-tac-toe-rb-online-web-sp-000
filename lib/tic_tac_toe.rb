WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(position)
  position.to_i - 1
end

def move(array, index, current_player)
  array[index] = current_player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index) 
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

def current_player(board)
  turns = turn_count(board)
  if turns % 2 == 0
   return "X"
  else
    return "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
  win_index_0 = win_combination[0]
  win_index_1 = win_combination[1]
  win_index_2 = win_combination[2]
 
   position_1 = board[win_index_0]
   position_2 = board[win_index_1]
   position_3 = board[win_index_2]
   
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination 
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end}
  return false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  
   if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
  
  



