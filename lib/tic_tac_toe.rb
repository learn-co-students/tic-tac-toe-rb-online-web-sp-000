WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
board= [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 def input_to_index(user_input)
  user_input.to_i - 1
end
def move(board, index, player)
  board[index] = player
end
def position_taken?(board, index)
  board[index] == 'X' || board[index] == 'O'
end
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end
def turn_count(board)
  board.count { |symbol| symbol == 'X' || symbol == 'O' }
end
 def current_player(board)
   turn_count(board).even? ? 'X' : 'O'
end
def turn(board)
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end
def won?(board)
  WIN_COMBINATIONS.detect do |win|
   board[win[0]] == board[win[1]] &&
     board[win[1]] == board[win[2]] &&
     position_taken?(board, win[0])
 end
 end
def full?(board)
  board.all? { |symbol| symbol == 'X' || symbol == 'O' }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end
def winner(board)
  if winning_win = won?(board)
    board[winning_win.first]
  end
end

def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
