def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won?(board)
  if WIN_COMBINATIONS == nil 
    return false
    
  elsif board[WIN_COMBINATIONS[0][0]] == "X" && 
  board[WIN_COMBINATIONS[0][1]] == "X" && 
  board[WIN_COMBINATIONS[0][2]] == "X"
    "X won in the top row"
    return WIN_COMBINATIONS[0] 
  elsif board[WIN_COMBINATIONS[0][0]] == "O" && 
  board[WIN_COMBINATIONS[0][1]] == "O" && 
  board[WIN_COMBINATIONS[0][2]] == "O"
    "O won in the top row"
    return WIN_COMBINATIONS[0] 
    
  elsif board[WIN_COMBINATIONS[1][0]] == "X" && board[WIN_COMBINATIONS[1][1]] == "X" && board[WIN_COMBINATIONS[1][2]] == "X"
    "X won in the middle row"
    return WIN_COMBINATIONS[1]
  elsif board[WIN_COMBINATIONS[1][0]] == "O" && board[WIN_COMBINATIONS[1][1]] == "O" && board[WIN_COMBINATIONS[1][2]] == "O"
    "O won in the middle row"
    return WIN_COMBINATIONS[1]
    
  elsif board[WIN_COMBINATIONS[2][0]] == "X" && board[WIN_COMBINATIONS[2][1]] == "X" && board[WIN_COMBINATIONS[2][2]] == "X"
    "X won in the bottom row"
    return WIN_COMBINATIONS[2] 
  elsif board[WIN_COMBINATIONS[2][0]] == "O" && board[WIN_COMBINATIONS[2][1]] == "O" && board[WIN_COMBINATIONS[2][2]] == "O"
    "O won in the bottom row"
    return WIN_COMBINATIONS[2] 
    
  elsif board[WIN_COMBINATIONS[3][0]] == "O" && board[WIN_COMBINATIONS[3][1]] == "O" && board[WIN_COMBINATIONS[3][2]] == "O"
    "O won in the left column"
    return WIN_COMBINATIONS[3] 
  elsif board[WIN_COMBINATIONS[3][0]] == "X" && board[WIN_COMBINATIONS[3][1]] == "X" && board[WIN_COMBINATIONS[3][2]] == "X"
    "X won in the left column"
    return WIN_COMBINATIONS[3]
    
  elsif board[WIN_COMBINATIONS[4][0]] == "O" && board[WIN_COMBINATIONS[4][1]] == "O" && board[WIN_COMBINATIONS[4][2]] == "O"
    "O won in the middle column"
    return WIN_COMBINATIONS[4]
  elsif board[WIN_COMBINATIONS[4][0]] == "X" && board[WIN_COMBINATIONS[4][1]] == "X" && board[WIN_COMBINATIONS[4][2]] == "X"
    "X won in the middle column"
    return WIN_COMBINATIONS[4]
    
  elsif board[WIN_COMBINATIONS[5][0]] == "O" && board[WIN_COMBINATIONS[5][1]] == "O" && board[WIN_COMBINATIONS[5][2]] == "O"
    "O won in the right column"
    return WIN_COMBINATIONS[5]
  elsif board[WIN_COMBINATIONS[5][0]] == "X" && board[WIN_COMBINATIONS[5][1]] == "X" && board[WIN_COMBINATIONS[5][2]] == "X"
    "X won in the right column"
    return WIN_COMBINATIONS[5]
    
  elsif board[WIN_COMBINATIONS[6][0]] == "O" && board[WIN_COMBINATIONS[6][1]] == "O" && board[WIN_COMBINATIONS[6][2]] == "O"
    "O won in the left diagonal"
    return WIN_COMBINATIONS[6]
  elsif board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X"
    "X won in the left diagonal"
    return WIN_COMBINATIONS[6]
    
  elsif board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O"
    "O won in the right diagonal"
    return WIN_COMBINATIONS[7]
  elsif board[WIN_COMBINATIONS[7][0]] == "X" && board[WIN_COMBINATIONS[7][1]] == "X" && board[WIN_COMBINATIONS[7][2]] == "X"
    "X won in the right diagonal"
    return WIN_COMBINATIONS[7]
  
  end
end

def full?(board)
  if board.all?{|i| i != " "}
    return true 
  elsif board.any?{|i| i == " "}
    return false
  end
end

def draw?(board)
  if won?(board) == nil &&
    full?(board) == true
    return true
  elsif 
    false 
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end


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
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |element|
    if element == "X" || element == "O"
    turns += 1
    end
  end
  turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 == 1 
    return "O"
  end
end

# def play(board)
#   counter = 0
#   until counter == 9
#     turn(board)
#     counter += 1
#   end
# end

def play(board)
  input = gets
  until over?
end
end
