def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
# "-----------", "   |   |   ", "-----------", "   |   |   "
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
    return false
end
end
# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, value)
  board[index] = value
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
board.each do |player|
  if player == "X" || player == "O"
    turn += 1
  end
end
turn
end

def current_player(board)
if turn_count(board).even?
  return "X"
else turn_count(board).odd?
  return "O"
end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
WIN_COMBINATIONS.each do |win|
  if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
    return win
  elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
    return win
  end
  end
  return false
end

def full?(board)
    board.all? do |position|
    position == "X" || position == "O"
    end
end


def draw?(board)
if full?(board) == true && won?(board) == false
return true
end
end

def over?(board)
if won?(board) || full?(board) || draw?(board)
  return true
end
end
#
def winner(board)
  if over?(board)
  return board[won?(board)[0]]
end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
 puts "Congratulations #{winner(board)}!"
elsif draw?(board) == true
      puts "Cat's Game!"
end
end
