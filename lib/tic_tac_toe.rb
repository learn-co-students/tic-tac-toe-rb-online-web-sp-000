# Helper Method

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  if index > 8 || index < 0
    false
  else
    !position_taken?(board, index)
  end
end

def move(board, index, token)
  board[index] = token
end

def input_to_index(input)
  index = input.to_i
  index -= 1
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  
  position_taken = position_taken?(board, index)
  valid_move = valid_move?(board, index)
  
  until !position_taken && valid_move do
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    position_taken = position_taken?(board, index)
    valid_move = valid_move?(board, index)
  end
  
  move(board, index, current_player(board))
  display_board(board)
end

def turn_count(board)
  turn = 0
  board.each do |token|
    token == "X" || token == "O" ? turn += 1 : next
  end
  turn
end

def current_player(board)
  player = turn_count(board) % 2
  player == 0 ? "X" : "O"
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|index| board[index] == "X"} || combination.all? {|index| board[index] == "O"}
      return combination
    end
  end
  false
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
  winner = won?(board)
  if winner
    board[winner[0]]
  else
    nil
  end
end

def play(board)
  turn(board)
  while !over?(board)
    turn(board)
  end
end