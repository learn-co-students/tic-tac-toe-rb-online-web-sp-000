# Define your WIN_COMBINATIONS constant
#
WIN_COMBINATIONS = 
  [[0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 4, 8],
   [2, 4, 6],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each { |combo|
    if (position_taken?(board, combo[0])) && board[combo[0]] === board[combo[1]] && board[combo[1]] === board[combo[2]]
      return combo
    end
  }
  return false
end

def full?(board)
  board.all? do |position|
    position === "X" || position === "O"
  end
end

def draw?(board) 
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  if (combo != false) 
    return board[combo[0]]
  end
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
    move(board, index)
    display_board(board)
  else
    puts "invalid move"
    turn(board)
  end
end

def turn_count(board) 
  counter = 0
  for val in board
    if (val == "X" || val == "O")
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turns = turn_count(board)
  (turns % 2 === 1) ? "O" : "X"
end 
