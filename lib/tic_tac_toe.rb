WIN_COMBINATIONS = [
  [0,1,2], #Top_row
  [3,4,5], #Middle_row
  [6,7,8], #bottom_row
  [0,3,6], #column_1
  [1,4,7], #column_2
  [2,5,8], #column_3
  [0,4,8], #diagonal_1
  [2,4,6] #diagonal_2
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
end

def move(board, index, character)
  board[index] = character
  return board
end

def position_taken?(board, index)
  if (board[index] == "X" || board[index] == "O")
    return true
  elsif board[index] == " "
    return false
  elsif board[index] == ""
    return false
  elsif board[index] == nil
    return false
  end
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn (board)
  puts "Please enter 1-9:"
  num = gets.strip.to_i #ask for input and get input
  index = input_to_index(num) #convert input to index
  if valid_move?(board, index)
    character = current_player(board)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      puts "#{counter}"
    end
  end

  counter
end


def current_player(board)
  turn_num = turn_count(board) + 1
  if turn_num.even? == true
    return "O"
  else
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? do|full|
    full == "X" || full == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  index = []
  index = won?(board)
  if index ==false
    return nil
  else
    if board[index[0]] == "O"
      return "O"
    else
      return "X"
    end
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!" #congratulate the winner
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
