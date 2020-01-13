WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left side
  [1,4,7], # Center vertical
  [2,5,8], # Right Side
  [2,4,6], # Diagnol 1
  [0,4,8] # Diagnol 2
]
def display_board(board=[" ", " ", " ", " ", " ", " ", " ", " ", " ", ])

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(num)
  index = num.to_i - 1

  return index
end

def move(array, index, character)
  array[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def on_board?(num)
  if num.between?(0, 8)
    return true
  else
    return false
  end
end

def valid_move?(board, index)
  if !(position_taken?(board, index)) && on_board?(index)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  num = gets.strip
  input = input_to_index(num)
  character = current_player(board)

  if valid_move?(board, input)
    move(board, input, character)
  else
    turn(board)
  end
  display_board(board)
end
def turn_count(board)
  count = 0
  board.each do |occ|
    if occ == "X"
      count += 1
    elsif occ == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left side
  [1,4,7], # Center vertical
  [2,5,8], # Right Side
  [2,4,6], # Diagnol 1
  [0,4,8] # Diagnol 2
]
def won?(board)
  WIN_COMBINATIONS.each do |wins|

    win_index_1 = wins[0]
    win_index_2 = wins[1]
    win_index_3 = wins[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 =board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return wins
    elsif
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return wins
    end
  end
  return false
end

def full?(board)
  board.all? { |full| full == "X" || full == "O"}
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
  idx = won?(board)
  if won?(board) == false
    return nil
  elsif  board[idx[0]] == "X"
    return "X"
  else
    return "O"
  end
end

def play(board)

  until over?(board)
    turn(board)
  end

    if won?(board) && winner(board) == "X"
      puts "Congratulations X!"
    elsif won?(board) && winner(board) == "O"
      puts "Congratulations O!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
end
