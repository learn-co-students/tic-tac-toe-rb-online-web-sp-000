WIN_COMBINATIONS = [
# Horizontal Wins
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
# Vertical Wins
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
# Diagonal Wins
  [0, 4, 8],
  [2, 4, 6],
]

def display_board(array)
  puts " #{array[0]} | #{array[1]} | #{array[2]} "
  puts "-----------"
  puts " #{array[3]} | #{array[4]} | #{array[5]} "
  puts "-----------"
  puts " #{array[6]} | #{array[7]} | #{array[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def valid_move?(board, index)
  (index.between?(0, 8) && !position_taken?(board, index)) ? true : false
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  turn = 0
  board.each { |item| (item === "X" || item === "O") ? turn += 1 : next}
  turn
end

def current_player(board)
  turn_count(board) % 2 === 0 ? "X" : "O"
end

def board_empty?(board)
  board.all? { |element| element === " " || element === ""}
end

def spaces?(board)
  board.any? { |element| element === " " || element === " "}
end

def full?(board)
  !spaces?(board)
end

def won?(board)
  return false if board_empty?(board) === true

  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X")
      return win_combination
    elsif (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
      return win_combination
    else
      next
    end
  end
  return false # Draw : board not empty and no winning combinations
end

def draw?(board)
  return false if !full?(board) # game in progressas

  case won?(board)
  when [0, 1, 2] # won in first row
    return false
  when [0, 4, 8] # won in L diagonal
    return false
  when [2, 4, 6] # won in R diagonal
    return false
  when false
    return true # draw
  end
end

def over?(board)
  return true if draw?(board)
  return true unless won?(board) === false
  return false if spaces?(board)
end

def winner(board)
  return nil if draw?(board)

  unless won?(board) === false
    winning_combo = won?(board)
    return board[winning_combo[0]]
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
  unless winner(board) === nil
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
# need at least 5 turns to have a winning combo
#       0    1    2    3    4    5   6    7    8
# X = [" ", " ", " ", " ", " ", " "," ", " ", " "]
# 0 | 1 | 2
# 3 | 4 | 5
# 6 | 7 | 8
