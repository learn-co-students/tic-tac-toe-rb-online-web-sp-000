WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

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
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |space| 
    if space == "X" || space == "O"
      turn += 1 
    end 
  end
  return turn
end

def current_player(board)
  turns_taken = turn_count(board)
  if turns_taken % 2 == 0 
    return "X" 
  else 
    return "O"
  end
end

def won?(board)
  won = false
  WIN_COMBINATIONS.each do |win_combination|
    win_space_1 = win_combination[0]
    win_space_2 = win_combination[1]
    win_space_3 = win_combination[2]
    
    board_1 = board[win_space_1]
    board_2 = board[win_space_2]
    board_3 = board[win_space_3]
    
    if board_1 == "X" && board_2 == "X" && board_3 == "X"
      won = true
      return win_combination
      break
    elsif board_1 == "O" && board_2 == "O" && board_3 == "O"
      won = true
      return win_combination
      break
    end
  end
  if won == false
    return false
  end
end 

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end 

def draw?(board)
  !won?(board) && full?(board)
end 

def over?(board)
  won?(board) || draw?(board) || full?(board)
end 

def winner(board)
  if won?(board) != false
    winning_positions = won?(board)
    first_spot = winning_positions[0]
    token = board[first_spot]
    return token
  else 
    return nil
  end
end 

def play(board)
  until over?(board) 
    turn(board)
  end 
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end 