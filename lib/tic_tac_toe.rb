# Win combinations
WIN_COMBINATIONS = [
  [0,1,2]
  [3,4,5]
  [6,7,8]
  [0,3,6]
  [1,4,7]
  [2,5,8]
  [0,4,8]
  [2,4,6]
]

#display board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input to index
def input_to_index(user_input)
  user_input.to_i - 1
end

#move
def move(board, index, current_player)
  board[index] = current_player
end

#position taken
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#valid move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#turn
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

#turn count
def turn_count (board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

#current player
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

#won
def won? (board)
  WIN_COMBINATIONS.find do |win|
    position_taken?(board,win)
  end
end

#full
def full?(board)
  board.all? do |taken|
    taken == "X" || taken =="O"
  end
end

#draw
def draw?(board)
  full?(board) && !won?(board)
end

#over
def over?(board)
  won?(board) || full?(board)
end

#winner
def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end

#play
def play(board)
  input = gets
end
