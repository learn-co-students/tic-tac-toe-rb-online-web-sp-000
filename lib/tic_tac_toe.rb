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

def input_to_index(userinput)
  userinput.to_i - 1
end

def move (array, index1, value)
  array[index1] = value
end

def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_move = input_to_index(gets.strip.to_i)
  if valid_move?(board, user_move) == true
    move(board, user_move, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |winning_com|
    board[winning_com[0]] == board[winning_com[1]] &&
    board[winning_com[1]] == board[winning_com[2]] &&
    position_taken?(board, winning_com[0])
    end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if champion = won?(board)
    board[champion.first]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
end
if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cat's Game!"
end
end
