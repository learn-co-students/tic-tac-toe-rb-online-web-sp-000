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
def move(board, index, current_player )
  board[index] = current_player
  if current_player = "X" || "O"
   return true
 else
   return false
 end
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end
def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  counter = 0
  if turn == "X" || turn == "O"
    counter +=1
    puts "#{counter}"
  end
end
counter
end
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"

end
def won?(board)
empty_board = board.all? {|empty| empty == " "}
draw = board.all? {|token| token == "X" || token == "O"}
WIN_COMBINATIONS.any? do |win_combo|
  if win_combo.all? {|index| board[index] =="X" } || win_combo.all? {|index| board[index] =="O"}
     return win_combo
  else empty_board || draw
      false
    end
  end
end
def full?(board)
  board.all? { |space| space == "X" || space == "O"}
end
def draw?(board)
  if won?(board)
    return false
  elsif !won?(board) && full?(board)
    return true
  else
    return false
  end
end
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end
def winner(board)
  index = []
  index = won?(board)
    if index == false
      return nil
    elsif
      board[index[0]] == "X"
        return "X"
    else
      return "O"
    end
end
