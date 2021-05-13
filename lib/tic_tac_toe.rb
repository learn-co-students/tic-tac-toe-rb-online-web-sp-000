def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end



# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #top row
  [3,4,5],  #middle row
  [6,7,8],  #bottom row
  [0,3,6],  #top left straight down to bottm left
  [1,4,7],  #top middle straight down to bottom middle
  [2,5,8],  #top right straigh down to bottom right
  [0,4,8],  #diagonal top left to bottom right
  [2,4,6]  #diagonal top right to bottom left
]

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def turn_count(board)
  #binding.pry
  count = 0
  board.each do |index|
    if index == "O" || index == "X"
      count += 1
    end
  end
  #binding.pry
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp()
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  
  WIN_COMBINATIONS.detect do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
  elsif
    board[win[0]]== "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return win
    end
  end
  false
end

def full?(board)
  board.each do |spot|
    if spot == " " 
      return false
    end
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    return nil
  end
end

def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{won?}"
    elsif
    over?(board)
  end
end



#so if the board is full game over other wise keep playing 

