WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]
board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn_count(board)
  count = board.count{|position| position == "X" || position == "O"}
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn(board)
# ask for input
  puts "Please enter 1-9 to take a position."
# get input
  input = gets.strip
# convert input to index
  index = input_to_index(input)
# if move is valid
  if valid_move?(board, index)
#  make the move for index and show board
    move(board, index, current_player(board))
    display_board(board)
# else
  else
#  ask for input again until you get a valid move
    puts "Try again."
    turn(board)
# end
  end

end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] &&
      (board[win_combo[0]] == "X" || board[win_combo[0]] == "O")
      return win_combo
    end
  end
  return false
end

def full?(board)
  if board.all? {|position| position == "X" || position == "O"}
    true
  else
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    character = board[won?(board)[0]]
    return character
  end
end

def play(board)
# until the game is over
  until over?(board)
#   take turns
    turn(board)
# end
  end
#
# if the game was won
  if winner(board)
    puts "Congratulations #{winner(board)}!"
#   congratulate the winner
# else if the game was a draw
  elsif draw?(board)
    puts "Cat's Game!"
#   tell the players it has been a draw
# end
  end
end
