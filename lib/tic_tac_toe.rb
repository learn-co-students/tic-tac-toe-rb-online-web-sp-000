WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  ]
  

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index);
  num = index.to_i - 1 
  return num 
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  if !position_taken?(board, index) && (index).between?(0,8)
    return true
  else 
    return false
  end
end

def turn_count(board)
  counter = 0 
  board.each {|index|
    if index == "X" || index == "O"
    counter += 1
    end
    }
  counter 
end

def current_player(board)
  turn_count(board) % 2 == 0? "X" : "O" 
end 


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else 
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |single_win|
    win_index_1 = single_win[0]
    win_index_2 = single_win[1]
    win_index_3 = single_win[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
   
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return single_win
    end
  end
  return false
end

def full?(board)
  if board.any? {|index| index == nil || index == " "}
    return false
  else
    return true 
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else 
    return false 
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board);
    return true
  end
end


def winner(board)
  if won?(board)
    return board[won?(board)[0]]
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






  
  