WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
    return user_input
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " "
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
    if valid_move?(board, index) == true
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  counter = 0
  board.each do |character|
    if character == "X" || character == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do | win_combination | 
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
 
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
 
    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      return win_combination
    end
  end
  false
end

def full?(board)
  !board.any? do | position | position == " "
  end
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    win_index_1 = win_combination[0]
    board[win_index_1]
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