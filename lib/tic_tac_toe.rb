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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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

def turn_count(board)
counter = 0
board.each do |space|
if space == "X" || space == "O" then counter += 1
    end
  end
counter
end

def current_player(board)
player = "X"
  if turn_count(board) % 2 == 0 then player = "X"
  else player = "O"
end
player
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return win_combination
    elsif
      board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return win_combination
    else
      false
    end
  end
  false
end


def full?(board)
  board.none?{|space| space == " "}
end

def draw?(board)
  won?(board) == false && full?(board) == true
end

def over?(board)
won?(board) || draw?(board)
end

def winner(board)
if won?(board) == false then nil else
win_array = won?(board)
board[win_array[0]]
end
end

def play(board)
  while over?(board) == false
    turn(board)
  end
  if draw?(board) == true then puts "Cat's Game!"
  else puts "Congratulations #{winner(board)}!"
  end
end
